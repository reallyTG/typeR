library(PeakSegJoint)


### Name: PeakSegJointSeveral
### Title: PeakSegJointSeveral
### Aliases: PeakSegJointSeveral

### ** Examples


library(PeakSegJoint)
data(H3K4me3.TDH.other.chunk8, envir=environment())
bf.vec <- c(2, 3, 5)
fit.list <-
  list(several=PeakSegJointSeveral(H3K4me3.TDH.other.chunk8, bf.vec))
for(bf in bf.vec){
  fit.list[[paste(bf)]] <-
    PeakSegJointHeuristicStep2(H3K4me3.TDH.other.chunk8, bf)
}
loss.list <- list()
segs.by.peaks.fit <- list()
for(fit.name in names(fit.list)){
  fit <- fit.list[[fit.name]]
  loss.list[[fit.name]] <- sapply(fit$models, "[[", "loss")
  converted <- ConvertModelList(fit)
  segs.by.peaks <- with(converted, split(segments, segments$peaks))
  for(peaks in names(segs.by.peaks)){
    model.segs <- segs.by.peaks[[peaks]]
    if(is.data.frame(model.segs)){
      segs.by.peaks.fit[[peaks]][[fit.name]] <-
        data.frame(fit.name, model.segs)
    }
  }
}
do.call(rbind, loss.list)

segs1 <- do.call(rbind, segs.by.peaks.fit[["10"]])
breaks1 <- subset(segs1, min(chromStart) < chromStart)
if(interactive() && require(ggplot2)){
  ggplot()+
    ggtitle(paste("PeakSegJointSeveral runs PeakSegJointHeuristic",
                  "and keeps only the most likely model"))+
    geom_step(aes(chromStart/1e3, count),
              color="grey50",
              data=H3K4me3.TDH.other.chunk8)+
    geom_vline(aes(xintercept=chromStart/1e3),
               data=breaks1,
               color="green",
               linetype="dashed")+
    geom_segment(aes(chromStart/1e3, mean,
                     xend=chromEnd/1e3, yend=mean),
                 size=1,
                 color="green",
                 data=segs1)+
    theme_bw()+
    theme(panel.margin=grid::unit(0, "cm"))+
    facet_grid(sample.id ~ fit.name, scales="free")
}

segs.by.peaks <- list()
for(peaks in 8:10){
  segs.by.peaks[[paste(peaks)]] <-
    data.frame(peaks, segs.by.peaks.fit[[paste(peaks)]][["several"]])
}
segs <- do.call(rbind, segs.by.peaks)
breaks <- subset(segs, min(chromStart) < chromStart)
if(interactive() && require(ggplot2)){
  ggplot()+
    ggtitle("PeakSegJoint models with 8-10 peaks")+
    geom_step(aes(chromStart/1e3, count),
              color="grey50",
              data=H3K4me3.TDH.other.chunk8)+
    geom_vline(aes(xintercept=chromStart/1e3),
               data=breaks,
               color="green",
               linetype="dashed")+
    geom_segment(aes(chromStart/1e3, mean,
                     xend=chromEnd/1e3, yend=mean),
                 size=1,
                 color="green",
                 data=segs)+
    theme_bw()+
    theme(panel.margin=grid::unit(0, "cm"))+
    facet_grid(sample.id ~ peaks, scales="free")
}




