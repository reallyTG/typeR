library(PeakSegJoint)


### Name: PeakSegJointFasterOne
### Title: PeakSegJointFasterOne
### Aliases: PeakSegJointFasterOne

### ** Examples


library(PeakSegJoint)
data(H3K36me3.TDH.other.chunk1, envir=environment())

some.counts <- subset(
  H3K36me3.TDH.other.chunk1$counts,
  43000000 < chromEnd &
  chromStart < 43200000 &
  sample.id %in% c("McGill0023", "McGill0022", "McGill0016", "McGill0013"))

id.df <- unique(some.counts[, c("cell.type", "sample.id")])
group.list <- split(paste(id.df$sample.id), id.df$cell.type, drop=TRUE)

loss.df.list <- list()
fit.list <- list()
for(bin.factor in 2:7){
  fit.fast <- PeakSegJointFasterOne(some.counts, bin.factor)
  fit.fast$min.loss <- sum(fit.fast$peak_loss_vec)
  fit.fast$sample.loss.diff.vec <- sort(with(fit.fast, structure(
    peak_loss_vec-flat_loss_vec, names=sample.id)))
  fit.fast$group.loss.diff.vec <- sort(sapply(group.list, function(sid.vec){
    sum(fit.fast$sample.loss.diff.vec[sid.vec])
  }))
  fit.fast$sample.loss.vec <- with(fit.fast, structure(
    sum(flat_loss_vec)+cumsum(c(0, sample.loss.diff.vec)),
    names=paste0(0:length(sample.loss.diff.vec), "samples")))
  fit.fast$group.loss.vec <- with(fit.fast, structure(
    sum(flat_loss_vec)+cumsum(c(0, group.loss.diff.vec)),
    names=paste0(0:length(group.loss.diff.vec), "groups")))
  loss.df.list[[paste(bin.factor)]] <- with(fit.fast, data.frame(
    bin.factor,
    loss=sample.loss.vec,
    peaks=0:length(sample.loss.diff.vec)))
  fit.list[[paste(bin.factor)]] <- fit.fast
}
loss.df <- do.call(rbind, loss.df.list)
fit.best <- fit.list[[which.min(sapply(fit.list, "[[", "min.loss"))]]

norm.list <- list()
profile.list <- split(some.counts, some.counts$sample.id, drop=TRUE)
for(sample.id in names(profile.list)){
  one <- profile.list[[sample.id]]
  max.count <- max(one$count)
  one$count.norm <- one$count/max.count
  norm.list[[sample.id]] <- one
}
norm.df <- do.call(rbind, norm.list)

if(interactive() && require(ggplot2)){
  
  peaks.df.list <- list()
  for(n.samples in 1:length(fit.best$sample.loss.diff.vec)){
    peaks.df.list[[paste(n.samples)]] <- with(fit.best, data.frame(
      samples=n.samples,
      sample.id=names(sample.loss.diff.vec)[1:n.samples],
      chromStart=peak_start_end[1],
      chromEnd=peak_start_end[2]))
  }
  peaks <- do.call(rbind, peaks.df.list)
  best.peaks <- transform(peaks, y=samples*-0.1, what="peaks")
  ggplot()+
    ggtitle("model for each sample")+
    scale_color_manual(values=c(data="grey50",
                         peaks="deepskyblue",
                         bins="black", segments="green"))+
    geom_step(aes(chromStart/1e3, count.norm, color=what),
              data=data.frame(norm.df, what="data"))+
    geom_segment(aes(chromStart/1e3, y,
                     xend=chromEnd/1e3, yend=y,
                     color=what),
                 size=1,
                 data=best.peaks)+
    geom_text(aes(chromStart/1e3, y,
                  label=paste0(samples, " sample",
                    ifelse(samples==1, "", "s"), " "),
                  color=what),
              hjust=1,
              size=3,
              vjust=0.5,
              data=best.peaks)+
    theme_bw()+
    theme(panel.margin=grid::unit(0, "cm"))+
    facet_grid(sample.id ~ ., scales="free")

  ## same thing but for each group.
  peaks.df.list <- list()
  for(n.groups in 1:length(fit.best$group.loss.diff.vec)){
    group.vec <- names(fit.best$group.loss.diff.vec[1:n.groups])
    meta.df <- do.call(rbind, lapply(group.vec, function(cell.type){
      data.frame(cell.type, sample.id=group.list[[cell.type]])
    }))
    peaks.df.list[[paste(n.groups)]] <- with(fit.best, data.frame(
      groups=n.groups,
      meta.df,
      chromStart=peak_start_end[1],
      chromEnd=peak_start_end[2]))
  }
  peaks <- do.call(rbind, peaks.df.list)
  best.peaks <- transform(peaks, y=groups*-0.1, what="peaks")
  ggplot()+
    ggtitle("model for each group")+
    scale_color_manual(values=c(data="grey50",
                         peaks="deepskyblue",
                         bins="black", segments="green"))+
    geom_step(aes(chromStart/1e3, count.norm, color=what),
              data=data.frame(norm.df, what="data"))+
    geom_segment(aes(chromStart/1e3, y,
                     xend=chromEnd/1e3, yend=y,
                     color=what),
                 size=1,
                 data=best.peaks)+
    geom_text(aes(chromStart/1e3, y,
                  label=paste0(groups, " group",
                    ifelse(groups==1, "", "s"), " "),
                  color=what),
              hjust=1,
              size=3,
              vjust=0.5,
              data=best.peaks)+
    theme_bw()+
    theme(panel.margin=grid::unit(0, "cm"))+
    facet_grid(sample.id + cell.type ~ ., scales="free")

  min.df <- subset(loss.df, peaks==max(peaks))
  ggplot()+
    geom_line(aes(peaks, loss, group=bin.factor), data=loss.df)+
    geom_text(aes(peaks, loss, label=bin.factor), data=min.df, hjust=0)

  if(require(microbenchmark)){

    N.samples.vec <- 10^seq(1, 3, by=0.5)
    max.N <- max(N.samples.vec)
    N.bases <- 10
    rmat <- function(Nr, Nc, mu){
      matrix(rpois(Nr*Nc, mu), Nr, Nc)
    }
    set.seed(1)
    big.mat <- cbind(
      rmat(max.N, N.bases, 5),
      rmat(max.N, N.bases, 10),
      rmat(max.N, N.bases, 5))
    big.df <- data.frame(
      sample.id=as.integer(row(big.mat)),
      chromStart=as.integer(col(big.mat)-1),
      chromEnd=as.integer(col(big.mat)),
      count=as.integer(big.mat))
    full.list <- ProfileList(big.df)
    time.df.list <- list()
    for(N.samples in N.samples.vec){
      partial.list <- full.list[1:N.samples]
      result <- microbenchmark(
        Heuristic=PeakSegJointHeuristic(partial.list, 2L),
        Faster=PeakSegJointFasterOne(partial.list, 2L),
        times=2L)
      time.df.list[[paste(N.samples)]] <- data.frame(
        N.samples,
        result)
    }
    time.df <- do.call(rbind, time.df.list)

    ggplot()+
      geom_point(aes(
        N.samples, time/1e9, color=expr),
        data=time.df)+
      scale_x_log10()+
      scale_y_log10("seconds")
    
  }

}




