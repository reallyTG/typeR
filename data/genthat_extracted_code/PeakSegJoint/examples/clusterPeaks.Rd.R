library(PeakSegJoint)


### Name: clusterPeaks
### Title: clusterPeaks
### Aliases: clusterPeaks

### ** Examples

unordered <-
  data.frame(chromStart=c(11, 12, 1, 2, 3, 6, 7),
             chromEnd=c(13, 14, 5, 8, 4, 9, 10),
             sample.id=factor(paste0("sample.", c(1, 2, 1, 2, 3, 4, 5))))
clustered <- clusterPeaks(unordered)
library(ggplot2)
bases <- geom_text(aes(position, "base", label=base),
                   data=data.frame(position=1:20, base="N"))
gg <- ggplot()+bases+ylab("")+
  scale_x_continuous(breaks=1:20)

gg+
  geom_segment(aes(chromStart+1/2, sample.id,
                   xend=chromEnd+1/2, yend=sample.id),
                   data=clustered)+
  theme_bw()+
  theme(panel.margin=grid::unit(0, "cm"))+
  facet_grid(.~cluster, labeller=label_both, scales="free", space="free")

gg+
  geom_segment(aes(chromStart+1/2, sample.id,
                   xend=chromEnd+1/2, yend=sample.id, color=factor(cluster)),
                   data=clustered)



