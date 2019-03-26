library(testthat)
context("PeakSegJoint")

library(PeakSegJoint)
library(ggplot2)

test_that("PeakSegJointHeuristic C result agrees with R", {
  data(H3K36me3.TDH.other.chunk1)
  lims <- c(43000000, 43200000) # left
  some.sample.ids <- H3K36me3.TDH.other.chunk1$counts$sample.id
  some.counts <-
    subset(H3K36me3.TDH.other.chunk1$counts,
           sample.id %in% some.sample.ids &
           lims[1] < chromEnd & chromStart < lims[2])
  some.regions <- subset(H3K36me3.TDH.other.chunk1$regions,
                         chromStart < lims[2] &
                           sample.id %in% some.sample.ids)
  ann.colors <-
    c(noPeaks="#f6f4bf",
      peakStart="#ffafaf",
      peakEnd="#ff4c4c",
      peaks="#a445ee")
  ggplot()+
    penaltyLearning::geom_tallrect(aes(
      xmin=chromStart/1e3, xmax=chromEnd/1e3,
      fill=annotation),
                  alpha=0.5,
                  data=some.regions)+
    scale_fill_manual(values=ann.colors)+
    geom_step(aes(chromStart/1e3, count), data=some.counts)+
    theme_bw()+
    theme(panel.margin=grid::unit(0, "cm"))+
    facet_grid(sample.id ~ ., scales="free")

  fit <- PeakSegJointHeuristicStep2(some.counts)
  
  ## Begin R implementation of multiple sample constrained
  ## segmentation heuristic. Input: profiles data.frame.
  profiles <- some.counts
  unfilled.profile.list <- split(profiles, profiles$sample.id, drop=TRUE)
  unfilled.chromStart <- min(sapply(unfilled.profile.list, with, chromStart[1]))
  unfilled.chromEnd <-
    max(sapply(unfilled.profile.list, with, chromEnd[length(chromEnd)]))
  unfilled.bases <- unfilled.chromEnd-unfilled.chromStart
  bin.factor <- 2L
  bases.per.bin <- 1L
  while(unfilled.bases/bases.per.bin/bin.factor >= 4){
    bases.per.bin <- bases.per.bin * bin.factor
  }
  n.bins <- as.integer(unfilled.bases %/% bases.per.bin + 1L)
  expect_equal(fit$n_bins, n.bins)
  expect_equal(fit$bases_per_bin, bases.per.bin)
  expect_equal(fit$bin_factor, bin.factor)
  R.data.start.end <- c(unfilled.chromStart, unfilled.chromEnd)
  expect_equal(fit$data_start_end, R.data.start.end)

  extra.bases <- n.bins * bases.per.bin - unfilled.bases
  extra.before <- as.integer(extra.bases/2)
  extra.after <- extra.bases - extra.before
  max.chromStart <- unfilled.chromStart-extra.before
  min.chromEnd <- unfilled.chromEnd + extra.after
  profile.list <- list()
  for(sample.id in names(unfilled.profile.list)){
    one.sample <- 
      subset(unfilled.profile.list[[sample.id]],
             unfilled.chromStart < chromEnd &
               chromStart <= unfilled.chromEnd)
    profile.list[[sample.id]] <- one.sample
  }
  bases <- min.chromEnd-max.chromStart

  expect_identical(fit$bin_start_end[1], max.chromStart)
  expect_identical(fit$bin_start_end[2], min.chromEnd)
  
  ## Small bins are just for testing the computation of the loss
  ## function in the R implementation, and should not be ported to C
  ## code.
  n.samples <- length(profile.list)
  small.chromEnd <- (max.chromStart+1):min.chromEnd
  small.bins <-
    matrix(NA, bases, n.samples,
           dimnames=list(position=small.chromEnd,
             sample.id=names(profile.list)))
  for(sample.id in names(profile.list)){
    one <- profile.list[[sample.id]]
    bins <- binSum(one, max.chromStart, n.bins=bases,
                   empty.as.zero=TRUE)
    stopifnot(bins$chromEnd == small.chromEnd)
    small.bins[, sample.id] <- bins$count
  }

  na.mat <- 
    matrix(NA, n.bins, n.samples,
           dimnames=list(bin=NULL, sample.id=names(profile.list)))
  first.cumsums <- list(count=na.mat)
  bin.list <- list()
  norm.list <- list()
  for(sample.i in seq_along(profile.list)){
    sample.id <- names(profile.list)[sample.i]
    one <- profile.list[[sample.i]]
    max.count <- max(one$count)
    bins <- binSum(one, max.chromStart, bases.per.bin, n.bins)
    stopifnot(n.bins == nrow(bins))
    bins$mean <- with(bins, count/(chromEnd-chromStart))
    bins$mean.norm <- bins$mean/max.count
    bin.list[[sample.id]] <- data.frame(sample.id, rbind(bins, NA))
    stopifnot(bins$count >= 0)
    first.cumsums$count[, sample.i] <- cumsum(bins$count)
    one$count.norm <- one$count/max.count
    norm.list[[sample.i]] <- one
  }
  bin.df <- do.call(rbind, bin.list)
  norm.df <- do.call(rbind, norm.list)

  ggplot()+
    scale_color_manual(values=c(data="grey50",
                         bins="black", segments="green"))+
    geom_step(aes(chromStart/1e3, count, color=what),
              data=data.frame(norm.df, what="data"))+
    geom_segment(aes(chromStart/1e3, mean,
                     xend=chromEnd/1e3, yend=mean,
                     color=what),
                 data=data.frame(bin.df, what="bins"))+
    theme_bw()+
    theme(panel.margin=grid::unit(0, "cm"))+
    facet_grid(sample.id ~ ., scales="free", labeller=function(var, val){
      sub("McGill0", "", val)
    })
  
  ## The formula for the optimal Poisson loss 
  ## for 1 segment with d integer data points x_j is
  ## \sum_{j=1}^d m - x_j \log m_j =
  ##   ( \sum_{j=1}^d x_j ) (1-\log m)
  ## where the segment mean m = (\sum x_j)/d,
  OptimalPoissonLoss <- function(mean.value, cumsum.value){
    ifelse(mean.value == 0, 0, cumsum.value * (1-log(mean.value)))
  }
  loss.list <- list()
  peak.list <- list()
  seg.list <- list()
  best.loss.list <- list()
  flat.cumsums <- first.cumsums$count[n.bins, ]
  flat.means <- flat.cumsums/unfilled.bases

  expect_equal(fit$sample_mean_vec, as.numeric(flat.means))
  expect_equal(fit$last_cumsum_vec, as.numeric(flat.cumsums))
  
  flat.loss.vec <- OptimalPoissonLoss(flat.means, flat.cumsums)
  best.loss.list[["0"]] <- sum(flat.loss.vec)
  for(seg1.last in 1:(n.bins-2)){
    seg1.cumsums <- first.cumsums$count[seg1.last, ]
    seg1.bases <- seg1.last*bases.per.bin
    seg1.chromEnd <- seg1.bases + max.chromStart
    seg1.corrected <- seg1.bases - extra.before
    seg1.means <- seg1.cumsums/seg1.corrected
    seg1.loss.vec <- OptimalPoissonLoss(seg1.means, seg1.cumsums)
    seg1.loss <- sum(seg1.loss.vec)
    for(seg2.last in (seg1.last+1):(n.bins-1)){
      cumsum.seg2.end <- first.cumsums$count[seg2.last, ]
      seg2.cumsums <- cumsum.seg2.end-seg1.cumsums
      seg12.bases <- seg2.last*bases.per.bin
      seg2.bases <- seg12.bases - seg1.bases
      seg2.chromEnd <- seg1.chromEnd + seg2.bases
      seg2.means <- seg2.cumsums/seg2.bases
      seg2.loss.vec <- OptimalPoissonLoss(seg2.means, seg2.cumsums)
      seg2.loss <- sum(seg2.loss.vec)
      
      seg3.cumsums <- first.cumsums$count[n.bins, ]-cumsum.seg2.end
      seg3.bases <- bases - seg12.bases
      seg3.corrected <- seg3.bases - extra.after
      seg3.means <- seg3.cumsums/seg3.corrected

      mean.mat <- rbind(seg1.means, seg2.means, seg3.means)

      this.seg.list <- list()
      for(sample.id in colnames(mean.mat)){
        this.seg.list[[sample.id]] <-
          data.frame(sample.id,
                     chromStart=c(max.chromStart, seg1.chromEnd, seg2.chromEnd,
                                  max.chromStart),
                     chromEnd=c(seg1.chromEnd, seg2.chromEnd, min.chromEnd,
                                min.chromEnd),
                     mean=c(mean.mat[, sample.id], flat.means[[sample.id]]),
                     segments=c(3, 3, 3, 1))
      }
      these.segs <- do.call(rbind, this.seg.list)
      ggplot()+
        scale_color_manual(values=c(data="grey50",
                             bins="black", segments="green"))+
        geom_step(aes(chromStart/1e3, count, color=what),
                  data=data.frame(norm.df, what="data"))+
        geom_segment(aes(chromStart/1e3, mean,
                         xend=chromEnd/1e3, yend=mean,
                         color=what),
                     size=1,
                     data=data.frame(these.segs, what="segments"))+
        geom_segment(aes(chromStart/1e3, mean,
                         xend=chromEnd/1e3, yend=mean,
                         color=what),
                     data=data.frame(bin.df, what="bins"))+
        theme_bw()+
        theme(panel.margin=grid::unit(0, "cm"))+
        facet_grid(sample.id ~ ., scales="free", labeller=function(var, val){
          sub("McGill0", "", val)
        })
      
      seg3.loss.vec <- OptimalPoissonLoss(seg3.means, seg3.cumsums)
      seg3.loss <- sum(seg3.loss.vec)
      seg123.loss.vec <- seg1.loss.vec + seg2.loss.vec + seg3.loss.vec

      peak.feasible <- seg1.means < seg2.means & seg2.means > seg3.means
      if(any(peak.feasible)){
        diff.loss.vec <- flat.loss.vec - seg123.loss.vec
        possible.df <- 
          data.frame(flat.loss.vec, seg123.loss.vec,
                     diff.loss.vec, peak.feasible)
        feasible.df <- subset(possible.df, peak.feasible)
        ordered.df <- 
          feasible.df[order(feasible.df$diff.loss.vec, decreasing = TRUE), ]
        for(peaks in 1:nrow(ordered.df)){
          with.peaks <- ordered.df[1:peaks, ]
          with.segs <-
            subset(these.segs,
                   sample.id %in% rownames(with.peaks) & segments==3)
          without.segs <-
            subset(these.segs,
                   !sample.id %in% rownames(with.peaks) & segments==1)
          without.peaks <-
            possible.df[!rownames(possible.df) %in% rownames(with.peaks),]
          with.loss <- with.peaks$seg123.loss.vec
          without.loss <- without.peaks$flat.loss.vec
          total.loss <- sum(with.loss, without.loss)
          loss.list[[paste(peaks)]][[paste(seg1.last, seg2.last)]] <-
            data.frame(seg1.last, seg2.last, peaks, total.loss)
          peak.list[[paste(peaks)]][[paste(seg1.last, seg2.last)]] <- 
            data.frame(sample.id=rownames(with.peaks),
                       chromStart=seg1.last*bases.per.bin+max.chromStart,
                       chromEnd=seg2.last*bases.per.bin+max.chromStart)
          seg.list[[paste(peaks)]][[paste(seg1.last, seg2.last)]] <-
            rbind(without.segs, with.segs)
        }#peaks
      }#any(peak.feasible)
    }#seg2.last
  }#seg1.last
  best.seg.list <- list()
  best.peak.list <- list()
  best.indices.list <- list()
  for(peaks.str in names(loss.list)){
    loss.df <- do.call(rbind, loss.list[[peaks.str]])
    loss.best <- loss.df[which.min(loss.df$total.loss), ]
    best.indices.list[[peaks.str]] <- loss.best
    last.str <- with(loss.best, paste(seg1.last, seg2.last))
    peaks <- as.numeric(peaks.str)
    model.i <- peaks + 1
    model <- fit$models[[model.i]]
    
    peak.df <- peak.list[[peaks.str]][[last.str]]

    sample.i <- model$samples_with_peaks_vec + 1
    C.sample.id <- fit$sample.id[sample.i]
    C.sample.sorted <- sort(paste(C.sample.id))
    R.sample.sorted <- sort(paste(peak.df$sample.id))
    expect_identical(C.sample.sorted, R.sample.sorted)

    seg.df <- seg.list[[peaks.str]][[last.str]]

    ggplot()+
      ggtitle(paste0("best model with ", peaks,
                    " peak", ifelse(peaks==1, "", "s")))+
      scale_color_manual(values=c(data="grey50",
                           bins="black", segments="green"))+
      geom_step(aes(chromStart/1e3, count, color=what),
                data=data.frame(norm.df, what="data"))+
      geom_segment(aes(chromStart/1e3, mean,
                       xend=chromEnd/1e3, yend=mean,
                       color=what),
                   size=1,
                   data=data.frame(seg.df, what="segments"))+
      geom_segment(aes(chromStart/1e3, mean,
                       xend=chromEnd/1e3, yend=mean,
                       color=what),
                   data=data.frame(bin.df, what="bins"))+
      theme_bw()+
      theme(panel.margin=grid::unit(0, "cm"))+
      facet_grid(sample.id ~ ., scales="free", labeller=function(var, val){
        sub("McGill0", "", val)
      })

    best.seg.list[[peaks.str]] <- data.frame(peaks, seg.df)
    best.peak.list[[peaks.str]] <-
      data.frame(peaks, y=peaks*-0.1, peak.df)
    best.loss.list[[peaks.str]] <- loss.best$total.loss
  }
  
  best.peaks <- do.call(rbind, best.peak.list)
  by.sample.loc <-
    split(best.peaks, with(best.peaks, paste(sample.id, chromStart, chromEnd)))
  short.label.list <- list()
  for(sample.loc.name in names(by.sample.loc)){
    sample.loc <- by.sample.loc[[sample.loc.name]]
    peaks.txt <- paste(sample.loc$peaks, collapse=",")
    short.label.list[[sample.loc.name]] <-
      data.frame(sample.loc[1,], peaks.txt)
  }
  short.labels <- do.call(rbind, short.label.list)
  best.peaks$sample.id <- factor(best.peaks$sample.id, names(profile.list))
  sample.counts <- table(best.peaks$sample.id)
  dftype <- function(what, df){
    df$sample.id <- factor(df$sample.id, names(sample.counts))
    data.frame(what, df)
  }
  ggplot()+
    scale_color_manual(values=c(data="grey50",
                         bins="black", peaks="deepskyblue"))+
    geom_step(aes(chromStart/1e3, count.norm, color=what),
              data=dftype("data", norm.df))+
    geom_segment(aes(chromStart/1e3, y,
                     xend=chromEnd/1e3, yend=y,
                     color=what),
                 size=1,
                 data=dftype("peaks", best.peaks))+
    geom_text(aes(chromStart/1e3, y,
                     label=paste0(peaks, " peak",
                       ifelse(peaks==1, "", "s"), " "),
                     color=what),
              hjust=1,
              size=3,
              vjust=0.5,
              data=dftype("peaks", best.peaks))+
    geom_segment(aes(chromStart/1e3, mean.norm,
                     xend=chromEnd/1e3, yend=mean.norm,
                     color=what),
                 data=dftype("bins", bin.df))+
    theme_bw()+
    theme(panel.margin=grid::unit(0, "cm"))+
    facet_grid(sample.id ~ ., scales="free", labeller=function(var, val){
      sub("McGill0", "", val)
    })
  ## for 0, 1, ..., maxPeaks, run the bin pyramid grid search,
  ## around the peaks found in this first step.
  zoom.peak.list <- list("0"=Peaks())
  zoom.loss.list <-
    list("0"=data.frame(peaks=0, loss=sum(flat.loss.vec)))
  for(peaks.str in names(best.indices.list)){
    loss.best <- best.indices.list[[peaks.str]]
    best.peak.df <- best.peak.list[[peaks.str]]
    samples.with.peaks <- paste(best.peak.df$sample.id)
    flat.without.peaks <- sum(flat.loss.vec)-
      sum(flat.loss.vec[samples.with.peaks])
    sub.norm.df <- subset(norm.df, sample.id %in% samples.with.peaks)
    sub.bin.df <- subset(bin.df, sample.id %in% samples.with.peaks)
    n.samples <- length(samples.with.peaks)
    last.cumsums <- list()
    before.cumsums <- list(left=list(), right=list())
    for(data.type in names(first.cumsums)){
      data.mat <- first.cumsums[[data.type]]
      last.cumsums[[data.type]] <-
        data.mat[nrow(data.mat),][samples.with.peaks]
      before.cumsums$left[[data.type]] <- if(loss.best$seg1.last == 1){
        structure(rep(0, n.samples), names=samples.with.peaks)
      }else{
        data.mat[loss.best$seg1.last-1,][samples.with.peaks]
      }
      before.cumsums$right[[data.type]] <-
        data.mat[loss.best$seg2.last-1,][samples.with.peaks]
    }
    last.chromEnd <- min.chromEnd
    n.bins.zoom <- bin.factor * 2L
    n.cumsum <- n.bins.zoom + 1L

    ## These will change at the end of each iteration.
    peakStart <- best.peak.df$chromStart[1]
    peakEnd <- best.peak.df$chromEnd[1]
    search.list <- list()
    best.list <- list()
    bases.per.bin.zoom <- bases.per.bin
    while(bases.per.bin.zoom > 1){
      left.chromStart <- peakStart - bases.per.bin.zoom
      right.chromStart <- peakEnd-bases.per.bin.zoom
      bases.per.bin.zoom <- as.integer(bases.per.bin.zoom / bin.factor)

      cumsum.list <- function(chromStart){
        limits <- bases.per.bin.zoom*(0:(n.cumsum-1))+chromStart
        chromStart.vec <- limits[-length(limits)]
        chromEnd.vec <- limits[-1]
        intervals <-
          paste0(chromStart.vec, "-", chromEnd.vec)
        dn <- list(bin=c("before", intervals), sample.id=samples.with.peaks)
        m <- matrix(NA, n.cumsum, n.samples, dimnames=dn)
        list(count=m, 
             chromStart=chromStart.vec, chromEnd=chromEnd.vec)
      }
      cumsum.mats <-
        list(left=cumsum.list(left.chromStart),
             right=cumsum.list(right.chromStart))

      for(sample.i in seq_along(samples.with.peaks)){
        sample.id <- samples.with.peaks[[sample.i]]
        one <- profile.list[[sample.id]]
        lr.list <-
          list(left=binSum(one, left.chromStart,
                 bases.per.bin.zoom, n.bins.zoom),
               right=binSum(one, right.chromStart,
                 bases.per.bin.zoom, n.bins.zoom,
                 empty.as.zero=TRUE))
        for(lr in names(lr.list)){
          lr.bins <- lr.list[[lr]]
          stopifnot(nrow(lr.bins) == n.bins.zoom)
          lr.bases <- with(lr.bins, chromEnd-chromStart)
          lr.before <- before.cumsums[[lr]]
          lr.counts <- list(count=lr.bins$count)
          for(data.type in names(lr.counts)){
            lr.count.vec <-
              c(lr.before[[data.type]][[sample.id]], lr.counts[[data.type]])
            cumsum.mats[[lr]][[data.type]][, sample.id] <-
              cumsum(lr.count.vec)
          }
        }
      }
      ##print(t(cumsum.mats$left$count[-1,]))
      possible.grid <- 
        expand.grid(left.cumsum.row=3:n.cumsum, right.cumsum.row=2:n.cumsum)
      possible.grid$left.chromStart <-
        cumsum.mats$left$chromStart[possible.grid$left.cumsum.row-1]
      possible.grid$left.chromEnd <-
        cumsum.mats$left$chromEnd[possible.grid$left.cumsum.row-1]
      possible.grid$right.chromStart <-
        cumsum.mats$right$chromStart[possible.grid$right.cumsum.row-1]
      possible.grid$right.chromEnd <-
        cumsum.mats$right$chromEnd[possible.grid$right.cumsum.row-1]
      feasible.grid <-
        subset(possible.grid,
               left.chromEnd <= right.chromStart &
                 right.chromEnd < last.chromEnd)
      feasible.grid$model.i <- 1:nrow(feasible.grid)
      model.list <- list()
      seg.list <- list()
      sample.loss.list <- list()
      for(model.i in feasible.grid$model.i){
        model.row <- feasible.grid[model.i, ]

        seg1.i <- model.row$left.cumsum.row-1
        seg1.cumsums <- cumsum.mats$left$count[seg1.i, ]
        seg1.chromEnd <- cumsum.mats$left$chromStart[seg1.i]
        seg1.bases <- seg1.chromEnd-max.chromStart
        seg1.corrected <- seg1.bases - extra.before
        seg1.means <- seg1.cumsums/seg1.corrected
        seg1.loss <- OptimalPoissonLoss(seg1.means, seg1.cumsums)
        seg.list[[paste(model.i, 1)]] <-
          data.frame(chromStart=max.chromStart, chromEnd=seg1.chromEnd,
                     mean=seg1.means, sample.id=samples.with.peaks,
                     model.i,
                     row.names=NULL)

        seg1.mat <-
          small.bins[## TODO: XXX < small.chromEnd
                     small.chromEnd <= seg1.chromEnd,
                     samples.with.peaks,
                     drop=FALSE]
        stopifnot(nrow(seg1.mat) == seg1.bases)
        ## stopifnot(all.equal(as.numeric(colMeans(seg1.mat)),
        ##                     as.numeric(seg1.means)))

        cumsum.seg2.end <-
          cumsum.mats$right$count[model.row$right.cumsum.row, ]
        seg2.cumsums <- cumsum.seg2.end-seg1.cumsums
        seg2.chromEnd <-
          cumsum.mats$right$chromEnd[model.row$right.cumsum.row-1]
        seg2.bases <- seg2.chromEnd-seg1.chromEnd
        seg2.means <- seg2.cumsums/seg2.bases
        seg2.loss <- OptimalPoissonLoss(seg2.means, seg2.cumsums)
        seg.list[[paste(model.i, 2)]] <-
          data.frame(chromStart=seg1.chromEnd, chromEnd=seg2.chromEnd,
                     mean=seg2.means, sample.id=samples.with.peaks,
                     model.i,
                     row.names=NULL)

        is.seg2 <-
          seg1.chromEnd < small.chromEnd &
            small.chromEnd <= seg2.chromEnd
        stopifnot(sum(is.seg2) == seg2.bases)
        seg2.mat <-
          small.bins[is.seg2,
                     samples.with.peaks,
                     drop=FALSE]
        stopifnot(all.equal(as.numeric(colMeans(seg2.mat)),
                            as.numeric(seg2.means)))
        
        seg3.cumsums <- last.cumsums$count-cumsum.seg2.end
        seg3.bases <- last.chromEnd-seg2.chromEnd
        seg3.corrected <- seg3.bases - extra.after
        seg3.means <- seg3.cumsums/seg3.corrected
        seg3.loss <- OptimalPoissonLoss(seg3.means, seg3.cumsums)
        seg.list[[paste(model.i, 3)]] <-
          data.frame(chromStart=seg2.chromEnd, chromEnd=last.chromEnd,
                     mean=seg3.means, sample.id=samples.with.peaks,
                     model.i,
                     row.names=NULL)

        is.seg3 <-
          seg2.chromEnd < small.chromEnd &
            small.chromEnd <= last.chromEnd
        stopifnot(sum(is.seg3) == seg3.bases)
        seg3.mat <-
          small.bins[is.seg3,
                     samples.with.peaks,
                     drop=FALSE]
        ## stopifnot(all.equal(as.numeric(colMeans(seg3.mat)),
        ##                     as.numeric(seg3.means)))

        total.bases <- sum(seg1.bases + seg2.bases + seg3.bases)
        stopifnot(all.equal(total.bases, last.chromEnd - max.chromStart))
        
        total.loss <- sum(seg1.loss + seg2.loss + seg3.loss)
        with.without.loss <- flat.without.peaks + total.loss
        total.loss.vec <- seg1.loss+seg2.loss+seg3.loss
        feasible.vec <- seg1.means < seg2.means & seg2.means > seg3.means
        model.list[[model.i]] <-
          data.frame(model.row, total.loss, with.without.loss,
                     feasible=all(feasible.vec))
        sample.loss.list[[model.i]] <-
          data.frame(sample.id=samples.with.peaks, loss=total.loss.vec)
      }
      ## Plot the segment means as a reality check.
      seg.df <- do.call(rbind, seg.list)
      ggplot()+
        geom_step(aes(chromStart/1e3, count),
                  data=data.frame(sub.norm.df, what="data"),
                  color="grey")+
        geom_segment(aes(chromStart/1e3, mean,
                         xend=chromEnd/1e3, yend=mean),
                     data=data.frame(seg.df, what="models"),
                     size=1, color="green")+
        theme_bw()+
        theme(panel.margin=grid::unit(0, "cm"))+
        facet_grid(sample.id ~ model.i, scales="free")

      ## Then plot the peaks only, colored by total cost of the model.
      model.df <- do.call(rbind, model.list)
      model.df$y <- with(model.df, model.i/max(model.i))
      feasible.models <- subset(model.df, feasible)
      best.model <- feasible.models[which.min(feasible.models$total.loss), ]

      ggplot()+
        coord_equal()+
        geom_point(aes(with.without.loss, total.loss),
                   data=model.df)

      ggplot()+
        xlab("position on chromosome (kilobases = kb)")+
        scale_y_continuous("", breaks=NULL)+
        geom_step(aes(chromStart/1e3, count.norm),
                  data=data.frame(sub.norm.df, what="data"),
                  color="grey")+
        geom_segment(aes(chromStart/1e3, mean.norm,
                         xend=chromEnd/1e3, yend=mean.norm),
                     data=data.frame(sub.bin.df, what="bins"),
                     color="black")+
        geom_segment(aes(peakStart/1e3, 0,
                         xend=peakEnd/1e3, yend=0),
                     data=data.frame(loss.best, what="peak"),
                     color="green")+
        scale_linetype_manual(values=c("TRUE"=1, "FALSE"=2))+
        geom_segment(aes(left.chromStart/1e3, y,
                         color=total.loss,
                         linetype=feasible,
                         xend=right.chromEnd/1e3, yend=y),
                     data=data.frame(model.df, sample.id="peaks"),
                     size=1)+
        geom_text(aes(left.chromStart/1e3, y,
                      label="optimal "),
                  data=data.frame(best.model, sample.id="peaks"),
                  hjust=1)+
        theme_bw()+
        theme(panel.margin=grid::unit(0, "cm"))+
        facet_grid(sample.id ~ .)

      search.list[[paste(bases.per.bin.zoom)]] <-
        data.frame(bases.per.bin.zoom, model.df)
      best.list[[paste(bases.per.bin.zoom)]] <-
        data.frame(bases.per.bin.zoom, best.model)

      peakStart <- best.model$left.chromStart
      peakEnd <- best.model$right.chromEnd
      before.i.list <-
        list(left=best.model$left.cumsum.row-2,
             right=best.model$right.cumsum.row-1)
      for(lr in names(before.i.list)){
        before.i <- before.i.list[[lr]]
        mats <- cumsum.mats[[lr]]
        before.cumsums[[lr]]$count <-
          structure(mats$count[before.i,],
                    names=colnames(mats$count))
      }
    }##while(bases.per.bin.zoom)
    samplefac <- function(L){
      df <- do.call(rbind, L)
      sample.ids <- unique(norm.df$sample.id)
      bases.num <- sort(unique(df$bases.per.bin.zoom), decreasing=TRUE)
      levs <- c(paste(sample.ids), paste(bases.num))
      df$sample.id <- factor(df$bases.per.bin.zoom, levs)
      df
    }
    search.df <- samplefac(search.list)
    best.df <- samplefac(best.list)
    C.cols <-
      c("bases.per.bin.zoom", "left.chromStart",
        "right.chromEnd", "with.without.loss")
    best.df[, C.cols]
    searchPlot <- 
      ggplot()+
        xlab("position on chromosome (kilobases = kb)")+
        scale_y_continuous("", breaks=NULL)+
        geom_step(aes(chromStart/1e3, count.norm),
                  data=data.frame(sub.norm.df, what="data"),
                  color="grey")+
        geom_segment(aes(chromStart/1e3, mean.norm,
                         xend=chromEnd/1e3, yend=mean.norm),
                     data=data.frame(sub.bin.df, what="bins"),
                     color="black")+
        geom_segment(aes(left.chromStart/1e3, y,
                         color=total.loss,
                         xend=right.chromEnd/1e3, yend=y),
                     data=search.df,
                     size=1)+
        geom_text(aes(left.chromStart/1e3, y,
                      label="selected"),
                  data=best.df,
                  hjust=1)+
        theme_bw()+
        theme(panel.margin=grid::unit(0, "cm"))+
        facet_grid(sample.id ~ ., labeller=function(var, val){
          sub("McGill0", "", val)
        })
    ## Check R=C implementation.
    peaks <- as.numeric(peaks.str)
    model.i <- peaks + 1
    model <- fit$models[[model.i]]
    sample.i <- model$samples_with_peaks_vec + 1
    C.sample.id <- fit$sample.id[sample.i]
    for(seg.i in 1:3){
      model.name <- paste(best.model$model.i, seg.i)
      seg.i.df <- seg.list[[model.name]]
      rownames(seg.i.df) <- seg.i.df$sample.id
      R.mean.vec <- as.numeric(seg.i.df[C.sample.id, "mean"])
      C.mean.vec <- model[[sprintf("seg%d_mean_vec", seg.i)]]
      expect_equal(C.mean.vec, R.mean.vec)
    }
    C.start.end <- model$peak_start_end
    R.start.end <- c(peakStart, peakEnd)
    expect_equal(C.start.end, R.start.end)
    
    loss.with.peaks <- sample.loss.list[[best.model$model.i]]
    samples.without.peaks <-
      names(profile.list)[!names(profile.list) %in% samples.with.peaks]
    loss.without.peaks <-
      data.frame(sample.id=samples.without.peaks,
                 loss=flat.loss.vec[samples.without.peaks])
    sample.loss.df <- rbind(loss.with.peaks, loss.without.peaks)
    peaks <- as.numeric(peaks.str)
    zoom.loss.list[[peaks.str]] <- 
      data.frame(peaks, loss=sum(sample.loss.df$loss))
    zoom.peak.list[[peaks.str]] <-
      data.frame(peaks, sample.id=samples.with.peaks,
                 chromStart=peakStart, chromEnd=peakEnd)
  }#peaks.str
  zoom.peaks <- do.call(rbind, zoom.peak.list)
  zoom.loss <- do.call(rbind, zoom.loss.list)
  R.loss.vec <- as.numeric(zoom.loss$loss)
  C.loss.Inf <- sapply(fit$models, "[[", "loss")
  C.loss.vec <- C.loss.Inf[C.loss.Inf != Inf]
  expect_equal(C.loss.vec, R.loss.vec)
  ggplot()+
    scale_color_manual(values=c(data="grey50",
                         bins="black", peaks="deepskyblue"))+
    geom_step(aes(chromStart/1e3, count.norm, color=what),
              data=dftype("data", norm.df))+
    geom_segment(aes(chromStart/1e3, -peaks*0.1,
                     xend=chromEnd/1e3, yend=-peaks*0.1,
                     color=what),
                 size=1,
                 data=dftype("peaks", zoom.peaks))+
    geom_text(aes(chromStart/1e3, -peaks*0.1,
                  label=paste0(peaks,
                    " peak",
                    ifelse(peaks==1, "", "s"),
                    " "),
                  color=what),
              hjust=1,
              vjust=0.5,
              size=3,
              data=dftype("peaks", zoom.peaks))+
    geom_segment(aes(chromStart/1e3, mean.norm,
                     xend=chromEnd/1e3, yend=mean.norm,
                     color=what),
                 data=dftype("bins", bin.df))+
    theme_bw()+
    theme(panel.margin=grid::unit(0, "cm"))+
    facet_grid(sample.id ~ ., scales="free", labeller=function(var, val){
      sub("McGill0", "", val)
    })
  ggplot()+
    geom_segment(aes(chromStart/1e3, peaks,
                     xend=chromEnd/1e3, yend=peaks),
                 data=zoom.peaks)
  ggplot(zoom.loss, aes(peaks, loss))+
    geom_point()+
    geom_line()
})

test_that("Step1 C result agrees with R", {
  data(H3K36me3.TDH.other.chunk1)
  lims <- c(43000000, 43200000) # left
  some.sample.ids <- H3K36me3.TDH.other.chunk1$counts$sample.id
  some.counts <-
    subset(H3K36me3.TDH.other.chunk1$counts,
           sample.id %in% some.sample.ids &
           lims[1] < chromEnd & chromStart < lims[2])
  some.regions <- subset(H3K36me3.TDH.other.chunk1$regions,
                         chromStart < lims[2] &
                           sample.id %in% some.sample.ids)
  ann.colors <-
    c(noPeaks="#f6f4bf",
      peakStart="#ffafaf",
      peakEnd="#ff4c4c",
      peaks="#a445ee")
  ggplot()+
    penaltyLearning::geom_tallrect(aes(
      xmin=chromStart/1e3, xmax=chromEnd/1e3,
      fill=annotation),
      alpha=0.5,
      data=some.regions)+
    scale_fill_manual(values=ann.colors)+
    geom_step(aes(chromStart/1e3, count), data=some.counts)+
    theme_bw()+
    theme(panel.margin=grid::unit(0, "cm"))+
    facet_grid(sample.id ~ ., scales="free")

  fit <- PeakSegJointHeuristicStep1(some.counts)
  
  ## Begin R implementation of multiple sample constrained
  ## segmentation heuristic. Input: profiles data.frame.
  profiles <- some.counts
  unfilled.profile.list <- split(profiles, profiles$sample.id, drop=TRUE)
  unfilled.chromStart <- min(sapply(unfilled.profile.list, with, chromStart[1]))
  unfilled.chromEnd <-
    max(sapply(unfilled.profile.list, with, chromEnd[length(chromEnd)]))
  unfilled.bases <- unfilled.chromEnd-unfilled.chromStart
  bin.factor <- 2L
  bases.per.bin <- 1L
  while(unfilled.bases/bases.per.bin/bin.factor >= 4){
    bases.per.bin <- bases.per.bin * bin.factor
  }
  n.bins <- as.integer(unfilled.bases %/% bases.per.bin + 1L)
  expect_equal(fit$n_bins, n.bins)
  expect_equal(fit$bases_per_bin, bases.per.bin)
  expect_equal(fit$bin_factor, bin.factor)
  R.data.start.end <- c(unfilled.chromStart, unfilled.chromEnd)
  expect_equal(fit$data_start_end, R.data.start.end)

  extra.bases <- n.bins * bases.per.bin - unfilled.bases
  extra.before <- as.integer(extra.bases/2)
  extra.after <- extra.bases - extra.before
  max.chromStart <- unfilled.chromStart-extra.before
  min.chromEnd <- unfilled.chromEnd + extra.after
  profile.list <- list()
  for(sample.id in names(unfilled.profile.list)){
    one.sample <- 
      subset(unfilled.profile.list[[sample.id]],
             unfilled.chromStart < chromEnd &
               chromStart <= unfilled.chromEnd)
    profile.list[[sample.id]] <- one.sample
  }
  bases <- min.chromEnd-max.chromStart
  ## End pre-processing to add zeros.

  expect_identical(fit$bin_start_end[1], max.chromStart)
  expect_identical(fit$bin_start_end[2], min.chromEnd)
  
  ## Small bins are just for testing the computation of the loss
  ## function in the R implementation, and should not be ported to C
  ## code.
  n.samples <- length(profile.list)
  small.chromEnd <- (max.chromStart+1):min.chromEnd
  small.bins <-
    matrix(NA, bases, n.samples,
           dimnames=list(position=small.chromEnd,
             sample.id=names(profile.list)))
  for(sample.id in names(profile.list)){
    one <- profile.list[[sample.id]]
    bins <- binSum(one, max.chromStart, n.bins=bases, empty.as.zero=TRUE)
    stopifnot(bins$chromEnd == small.chromEnd)
    small.bins[, sample.id] <- bins$count
  }

  na.mat <- 
    matrix(NA, n.bins, n.samples,
           dimnames=list(bin=NULL, sample.id=names(profile.list)))
  first.cumsums <- list(count=na.mat)
  bin.list <- list()
  norm.list <- list()
  for(sample.i in seq_along(profile.list)){
    sample.id <- names(profile.list)[sample.i]
    one <- profile.list[[sample.i]]
    max.count <- max(one$count)
    bins <- binSum(one, max.chromStart, bases.per.bin, n.bins)
    stopifnot(n.bins == nrow(bins))
    bins$mean <- with(bins, count/(chromEnd-chromStart))
    bins$mean.norm <- bins$mean/max.count
    bin.list[[sample.id]] <- data.frame(sample.id, rbind(bins, NA))
    stopifnot(bins$count >= 0)
    first.cumsums$count[, sample.i] <- cumsum(bins$count)
    one$count.norm <- one$count/max.count
    norm.list[[sample.i]] <- one
  }
  bin.df <- do.call(rbind, bin.list)
  norm.df <- do.call(rbind, norm.list)

  ggplot()+
    scale_color_manual(values=c(data="grey50",
                         bins="black", segments="green"))+
    geom_step(aes(chromStart/1e3, count, color=what),
              data=data.frame(norm.df, what="data"))+
    geom_segment(aes(chromStart/1e3, mean,
                     xend=chromEnd/1e3, yend=mean,
                     color=what),
                 data=data.frame(bin.df, what="bins"))+
    theme_bw()+
    theme(panel.margin=grid::unit(0, "cm"))+
    facet_grid(sample.id ~ ., scales="free", labeller=function(var, val){
      sub("McGill0", "", val)
    })
  
  ## The formula for the optimal Poisson loss 
  ## for 1 segment with d integer data points x_j is
  ## \sum_{j=1}^d m - x_j \log m_j =
  ##   ( \sum_{j=1}^d x_j ) (1-\log m)
  ## where the segment mean m = (\sum x_j)/d,
  OptimalPoissonLoss <- function(mean.value, cumsum.value){
    ifelse(mean.value == 0, 0, cumsum.value * (1-log(mean.value)))
  }
  loss.list <- list()
  peak.list <- list()
  seg.list <- list()
  best.loss.list <- list()
  flat.cumsums <- first.cumsums$count[n.bins, ]
  flat.means <- flat.cumsums/unfilled.bases

  expect_equal(fit$sample_mean_vec, as.numeric(flat.means))
  
  flat.loss.vec <- OptimalPoissonLoss(flat.means, flat.cumsums)
  R.flat.loss <- as.numeric(flat.loss.vec[fit$sample.id])
  expect_equal(fit$flat_loss_vec, R.flat.loss)
  
  best.loss.list[["0"]] <- sum(flat.loss.vec)
  for(seg1.last in 1:(n.bins-2)){
    seg1.cumsums <- first.cumsums$count[seg1.last, ]
    seg1.bases <- seg1.last*bases.per.bin
    seg1.chromEnd <- seg1.bases + max.chromStart
    seg1.corrected <- seg1.bases - extra.before
    seg1.means <- seg1.cumsums/seg1.corrected
    seg1.loss.vec <- OptimalPoissonLoss(seg1.means, seg1.cumsums)
    seg1.loss <- sum(seg1.loss.vec)
    for(seg2.last in (seg1.last+1):(n.bins-1)){
      cumsum.seg2.end <- first.cumsums$count[seg2.last, ]
      seg2.cumsums <- cumsum.seg2.end-seg1.cumsums
      seg12.bases <- seg2.last*bases.per.bin
      seg2.bases <- seg12.bases - seg1.bases
      seg2.chromEnd <- seg1.chromEnd + seg2.bases
      seg2.means <- seg2.cumsums/seg2.bases
      seg2.loss.vec <- OptimalPoissonLoss(seg2.means, seg2.cumsums)
      seg2.loss <- sum(seg2.loss.vec)
      
      seg3.cumsums <- first.cumsums$count[n.bins, ]-cumsum.seg2.end
      seg3.bases <- bases - seg12.bases
      seg3.corrected <- seg3.bases - extra.after
      seg3.means <- seg3.cumsums/seg3.corrected

      mean.mat <- rbind(seg1.means, seg2.means, seg3.means)

      this.seg.list <- list()
      for(sample.id in colnames(mean.mat)){
        this.seg.list[[sample.id]] <-
          data.frame(sample.id,
                     chromStart=c(max.chromStart, seg1.chromEnd, seg2.chromEnd,
                                  max.chromStart),
                     chromEnd=c(seg1.chromEnd, seg2.chromEnd, min.chromEnd,
                                min.chromEnd),
                     mean=c(mean.mat[, sample.id], flat.means[[sample.id]]),
                     segments=c(3, 3, 3, 1))
      }
      these.segs <- do.call(rbind, this.seg.list)
      ggplot()+
        scale_color_manual(values=c(data="grey50",
                             bins="black", segments="green"))+
        geom_step(aes(chromStart/1e3, count, color=what),
                  data=data.frame(norm.df, what="data"))+
        geom_segment(aes(chromStart/1e3, mean,
                         xend=chromEnd/1e3, yend=mean,
                         color=what),
                     size=1,
                     data=data.frame(these.segs, what="segments"))+
        geom_segment(aes(chromStart/1e3, mean,
                         xend=chromEnd/1e3, yend=mean,
                         color=what),
                     data=data.frame(bin.df, what="bins"))+
        theme_bw()+
        theme(panel.margin=grid::unit(0, "cm"))+
        facet_grid(sample.id ~ ., scales="free", labeller=function(var, val){
          sub("McGill0", "", val)
        })
      
      seg3.loss.vec <- OptimalPoissonLoss(seg3.means, seg3.cumsums)
      seg3.loss <- sum(seg3.loss.vec)
      seg123.loss.vec <- seg1.loss.vec + seg2.loss.vec + seg3.loss.vec

      peak.feasible <- seg1.means < seg2.means & seg2.means > seg3.means
      if(any(peak.feasible)){
        diff.loss.vec <- flat.loss.vec - seg123.loss.vec
        possible.df <- 
          data.frame(flat.loss.vec, seg123.loss.vec,
                     diff.loss.vec, peak.feasible)
        feasible.df <- subset(possible.df, peak.feasible)
        ordered.df <- 
          feasible.df[order(feasible.df$diff.loss.vec, decreasing = TRUE), ]
        for(peaks in 1:nrow(ordered.df)){
          with.peaks <- ordered.df[1:peaks, ]
          with.segs <-
            subset(these.segs,
                   sample.id %in% rownames(with.peaks) & segments==3)
          without.segs <-
            subset(these.segs,
                   !sample.id %in% rownames(with.peaks) & segments==1)
          without.peaks <-
            possible.df[!rownames(possible.df) %in% rownames(with.peaks),]
          with.loss <- with.peaks$seg123.loss.vec
          without.loss <- without.peaks$flat.loss.vec
          total.loss <- sum(with.loss, without.loss)
          loss.list[[paste(peaks)]][[paste(seg1.last, seg2.last)]] <-
            data.frame(seg1.last, seg2.last, peaks, total.loss)
          peak.list[[paste(peaks)]][[paste(seg1.last, seg2.last)]] <- 
            data.frame(sample.id=rownames(with.peaks),
                       chromStart=seg1.last*bases.per.bin+max.chromStart,
                       chromEnd=seg2.last*bases.per.bin+max.chromStart)
          seg.list[[paste(peaks)]][[paste(seg1.last, seg2.last)]] <-
            rbind(without.segs, with.segs)
        }#peaks
      }#any(peak.feasible)
    }#seg2.last
  }#seg1.last
  best.seg.list <- list()
  best.peak.list <- list()
  best.indices.list <- list()
  for(peaks.str in names(loss.list)){
    loss.df <- do.call(rbind, loss.list[[peaks.str]])
    loss.best <- loss.df[which.min(loss.df$total.loss), ]
    best.indices.list[[peaks.str]] <- loss.best
    last.str <- with(loss.best, paste(seg1.last, seg2.last))
    peaks <- as.numeric(peaks.str)
    model.i <- peaks + 1
    model <- fit$models[[model.i]]
    
    peak.df <- peak.list[[peaks.str]][[last.str]]
    C.start.end <- model$peak_start_end
    R.start.end <- as.integer(peak.df[1, c("chromStart", "chromEnd")])
    expect_equal(C.start.end, R.start.end)

    sample.i <- model$samples_with_peaks_vec + 1
    C.sample.id <- fit$sample.id[sample.i]
    C.sample.sorted <- sort(paste(C.sample.id))
    R.sample.sorted <- sort(paste(peak.df$sample.id))
    expect_identical(C.sample.sorted, R.sample.sorted)

    seg.df <- seg.list[[peaks.str]][[last.str]]
    segs.by.chromStart <- split(seg.df, seg.df$chromStart)
    for(seg.i in seq_along(segs.by.chromStart)){
      seg.i.df <- segs.by.chromStart[[seg.i]]
      rownames(seg.i.df) <- seg.i.df$sample.id
      R.mean.vec <- as.numeric(seg.i.df[C.sample.id, "mean"])
      C.mean.vec <- model[[sprintf("seg%d_mean_vec", seg.i)]]
      expect_equal(C.mean.vec, R.mean.vec)
    }

    ggplot()+
      ggtitle(paste0("best model with ", peaks,
                    " peak", ifelse(peaks==1, "", "s")))+
      scale_color_manual(values=c(data="grey50",
                           bins="black", segments="green"))+
      geom_step(aes(chromStart/1e3, count, color=what),
                data=data.frame(norm.df, what="data"))+
      geom_segment(aes(chromStart/1e3, mean,
                       xend=chromEnd/1e3, yend=mean,
                       color=what),
                   size=1,
                   data=data.frame(seg.df, what="segments"))+
      geom_segment(aes(chromStart/1e3, mean,
                       xend=chromEnd/1e3, yend=mean,
                       color=what),
                   data=data.frame(bin.df, what="bins"))+
      theme_bw()+
      theme(panel.margin=grid::unit(0, "cm"))+
      facet_grid(sample.id ~ ., scales="free", labeller=function(var, val){
        sub("McGill0", "", val)
      })

    best.seg.list[[peaks.str]] <- data.frame(peaks, seg.df)
    best.peak.list[[peaks.str]] <-
      data.frame(peaks, y=peaks*-0.1, peak.df)
    best.loss.list[[peaks.str]] <- loss.best$total.loss
  }
  R.loss.vec <- as.numeric(best.loss.list)
  C.loss.Inf <- sapply(fit$models, "[[", "loss")
  C.loss.vec <- C.loss.Inf[C.loss.Inf != Inf]
  expect_equal(C.loss.vec, R.loss.vec)
  
  best.peaks <- do.call(rbind, best.peak.list)
  by.sample.loc <-
    split(best.peaks, with(best.peaks, paste(sample.id, chromStart, chromEnd)))
  short.label.list <- list()
  for(sample.loc.name in names(by.sample.loc)){
    sample.loc <- by.sample.loc[[sample.loc.name]]
    peaks.txt <- paste(sample.loc$peaks, collapse=",")
    short.label.list[[sample.loc.name]] <-
      data.frame(sample.loc[1,], peaks.txt)
  }
  short.labels <- do.call(rbind, short.label.list)
  best.peaks$sample.id <- factor(best.peaks$sample.id, names(profile.list))
  sample.counts <- table(best.peaks$sample.id)
  dftype <- function(what, df){
    df$sample.id <- factor(df$sample.id, names(sample.counts))
    data.frame(what, df)
  }
  ggplot()+
    scale_color_manual(values=c(data="grey50",
                         bins="black", peaks="deepskyblue"))+
    geom_step(aes(chromStart/1e3, count.norm, color=what),
              data=dftype("data", norm.df))+
    geom_segment(aes(chromStart/1e3, y,
                     xend=chromEnd/1e3, yend=y,
                     color=what),
                 size=1,
                 data=dftype("peaks", best.peaks))+
    geom_text(aes(chromStart/1e3, y,
                     label=paste0(peaks, " peak",
                       ifelse(peaks==1, "", "s"), " "),
                     color=what),
              hjust=1,
              size=3,
              vjust=0.5,
              data=dftype("peaks", best.peaks))+
    geom_segment(aes(chromStart/1e3, mean.norm,
                     xend=chromEnd/1e3, yend=mean.norm,
                     color=what),
                 data=dftype("bins", bin.df))+
    theme_bw()+
    theme(panel.margin=grid::unit(0, "cm"))+
    facet_grid(sample.id ~ ., scales="free", labeller=function(var, val){
      sub("McGill0", "", val)
    })
  for(peaks.str in names(best.indices.list)){
    loss.best <- best.indices.list[[peaks.str]]
    best.peak.df <- best.peak.list[[peaks.str]]
    samples.with.peaks <- paste(best.peak.df$sample.id)
    n.samples <- length(samples.with.peaks)
    last.cumsums <- list()
    before.cumsums <- list(left=list(), right=list())
    for(data.type in names(first.cumsums)){
      data.mat <- first.cumsums[[data.type]]
      last.cumsums[[data.type]] <-
        data.mat[nrow(data.mat),][samples.with.peaks]
      before.cumsums$left[[data.type]] <- if(loss.best$seg1.last == 1){
        structure(rep(0, n.samples), names=samples.with.peaks)
      }else{
        data.mat[loss.best$seg1.last-1,][samples.with.peaks]
      }
      before.cumsums$right[[data.type]] <-
        data.mat[loss.best$seg2.last-1,][samples.with.peaks]
    }
    peaks <- as.integer(peaks.str)
    model.i <- peaks+1L
    model <- fit$models[[model.i]]
    C.sample.i <- model$samples_with_peaks_vec + 1L
    C.sample.id <- fit$sample.id[C.sample.i]
    for(lr in names(before.cumsums)){
      R.cumsums <- as.integer(before.cumsums[[lr]]$count[C.sample.id])
      C.cumsums <- model[[paste0(lr, "_cumsum_vec")]]
      expect_equal(C.cumsums, R.cumsums)
    }
  }
  R.last.cumsums <- as.integer(last.cumsums$count[fit$sample.id])
  C.last.cumsums <- fit$last_cumsum_vec
  C.last.cumsums[is.na(R.last.cumsums)] <- NA
  expect_equal(C.last.cumsums, R.last.cumsums)
  ## for 0, 1, ..., maxPeaks, run the bin pyramid grid search,
  ## around the peaks found in this first step.
})
