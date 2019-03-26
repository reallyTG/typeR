library(PeakSegOptimal)


### Name: PeakSegPDPAchrom
### Title: PeakSegPDPAchrom
### Aliases: PeakSegPDPAchrom

### ** Examples


## samples for which pdpa recovers a more likely model, but it is
## not feasible for the PeakSeg problem (some segment means are
## equal).
sample.id <- "McGill0322"
sample.id <- "McGill0079"
sample.id <- "McGill0106"
n.peaks <- 3
library(PeakSegOptimal)
data("H3K4me3_XJ_immune_chunk1", envir=environment())
H3K4me3_XJ_immune_chunk1$count <- H3K4me3_XJ_immune_chunk1$coverage
by.sample <-
  split(H3K4me3_XJ_immune_chunk1, H3K4me3_XJ_immune_chunk1$sample.id)
one.sample <- by.sample[[sample.id]]
pdpa.fit <- PeakSegPDPAchrom(one.sample, 9L)
pdpa.segs <- subset(pdpa.fit$segments, n.peaks == peaks)
both.segs.list <- list(pdpa=data.frame(pdpa.segs, algorithm="PDPA"))
pdpa.breaks <- subset(pdpa.segs, 1 < first)
pdpa.breaks$feasible <- ifelse(
  diff(pdpa.segs$mean)==0, "infeasible", "feasible")
both.breaks.list <- list(pdpa=data.frame(pdpa.breaks, algorithm="PDPA"))
if(require(PeakSegDP)){
  dp.fit <- PeakSegDP(one.sample, 9L)
  dp.segs <- subset(dp.fit$segments, n.peaks == peaks)
  dp.breaks <- subset(dp.segs, 1 < first)
  dp.breaks$feasible <- "feasible"
  both.segs.list$dp <- data.frame(dp.segs, algorithm="cDPA")
  both.breaks.list$dp <- data.frame(dp.breaks, algorithm="cDPA")
}
both.segs <- do.call(rbind, both.segs.list)
both.breaks <- do.call(rbind, both.breaks.list)
library(ggplot2)
ggplot()+
  theme_bw()+
  theme(panel.margin=grid::unit(0, "lines"))+
  facet_grid(algorithm ~ ., scales="free")+
  geom_step(aes(chromStart/1e3, coverage),
            data=one.sample, color="grey")+
  geom_segment(aes(chromStart/1e3, mean,
                   xend=chromEnd/1e3, yend=mean),
               color="green",
               data=both.segs)+
  scale_linetype_manual(values=c(feasible="dotted", infeasible="solid"))+
  geom_vline(aes(xintercept=chromStart/1e3, linetype=feasible),
             color="green",
             data=both.breaks)

## samples for which pdpa recovers some feasible models that the
## heuristic dp does not.
sample.id.vec <- c(
  "McGill0091", "McGill0107", "McGill0095",
  "McGill0059", "McGill0029", "McGill0010")
sample.id <- sample.id.vec[4]
one.sample <- by.sample[[sample.id]]
pdpa.fit <- PeakSegPDPAchrom(one.sample, 9L)
gg.loss <- ggplot()+
  scale_color_manual(values=c("TRUE"="black", "FALSE"="red"))+
  scale_size_manual(values=c(cDPA=1.5, PDPA=3))+
  scale_fill_manual(values=c(cDPA="white", PDPA="black"))+
  guides(color=guide_legend(override.aes=list(fill="black")))+
  geom_point(aes(peaks, PoissonLoss,
                 size=algorithm, fill=algorithm, color=feasible),
             shape=21,
             data=data.frame(pdpa.fit$loss, algorithm="PDPA"))
if(require(PeakSegDP)){
  dp.fit <- PeakSegDP(one.sample, 9L)
  gg.loss <- gg.loss+
    geom_point(aes(peaks, error,
                   size=algorithm, fill=algorithm),
               shape=21,
               data=data.frame(dp.fit$error, algorithm="cDPA"))
}
gg.loss

diff.df <- data.frame(
  PeakSegPDPA.loss=pdpa.fit$loss$PoissonLoss,
  PeakSegDP.loss=dp.fit$error$error,
  peaks=dp.fit$error$peaks)
ggplot()+
  geom_point(aes(peaks, PeakSegDP.loss - PeakSegPDPA.loss), data=diff.df)




