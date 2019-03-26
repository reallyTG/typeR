library(PeakSegJoint)


### Name: PeakSegJointError
### Title: PeakSegJointError
### Aliases: PeakSegJointError

### ** Examples


library(PeakSegJoint)
data(H3K36me3.TDH.other.chunk1, envir=environment())
lims <- c(43000000, 43200000) # left
some.counts <-
  subset(H3K36me3.TDH.other.chunk1$counts,
         lims[1] < chromEnd & chromStart < lims[2])
some.regions <-
  subset(H3K36me3.TDH.other.chunk1$regions,
         lims[1] < chromEnd & chromStart < lims[2])
fit <- PeakSegJointSeveral(some.counts)
converted <- ConvertModelList(fit)
error.list <- PeakSegJointError(converted, some.regions)

peaks.int.vec <- 1:3
show.peaks <- subset(converted$peaks, peaks %in% peaks.int.vec)
show.labels <- do.call(rbind, error.list$error.regions[paste(peaks.int.vec)])

if(interactive() && require(ggplot2)){
  ann.colors <-
    c(noPeaks="#f6f4bf",
      peakStart="#ffafaf",
      peakEnd="#ff4c4c",
      peaks="#a445ee")
  ggplot()+
    penaltyLearning::geom_tallrect(aes(
      xmin=chromStart/1e3, xmax=chromEnd/1e3, fill=annotation),
      alpha=0.5,
      color="grey",
      data=some.regions)+
    scale_fill_manual(values=ann.colors)+
    scale_linetype_manual("error type",
                          limits=c("correct", 
                                   "false negative",
                                   "false positive"
                                   ),
                          values=c(correct=0,
                                   "false negative"=3,
                                   "false positive"=1))+
    geom_step(aes(chromStart/1e3, count),
              color="grey50",
              data=some.counts)+
    penaltyLearning::geom_tallrect(aes(
      xmin=chromStart/1e3, xmax=chromEnd/1e3, linetype=status),
      fill=NA,
      color="black",
      size=1,
      data=show.labels)+
    geom_segment(aes(chromStart/1e3, 0,
                     xend=chromEnd/1e3, yend=0),
                 size=3,
                 color="deepskyblue",
                 data=show.peaks)+
    theme_bw()+
    theme(panel.margin=grid::unit(0, "cm"))+
    facet_grid(sample.id ~ peaks, scales="free")
}




