library(PeakSegJoint)


### Name: multiClusterPeaks
### Title: multiClusterPeaks
### Aliases: multiClusterPeaks

### ** Examples


library(PeakSegJoint)
data(chr7.peaks, envir=environment())
library(ggplot2)
ggplot()+
  geom_segment(aes(
    chromStart/1e3, sample.id,
    xend=chromEnd/1e3, yend=sample.id),
    data=chr7.peaks)

clustered <- multiClusterPeaks(chr7.peaks)
clustered.list <- split(clustered, clustered$cluster)
clusters.list <- list()
for(cluster.name in names(clustered.list)){
  clusters.list[[cluster.name]] <- with(
    clustered.list[[cluster.name]], data.frame(
      cluster=cluster[1],
      clusterStart=as.integer(median(chromStart)),
      clusterEnd=as.integer(median(chromEnd))))
}
clusters <- do.call(rbind, clusters.list)
ggplot()+
  geom_segment(aes(
    chromStart/1e3, sample.id,
    color=factor(cluster),
    xend=chromEnd/1e3, yend=sample.id),
    data=clustered)+
geom_segment(aes(
  clusterStart/1e3, "clusters",
  color=factor(cluster),
  xend=clusterEnd/1e3, yend="clusters"),
  data=clusters)




