library(leaderCluster)


### Name: leaderCluster
### Title: leaderCluster: Calculate clusters using Hartigan's Leader
###   Algorithm
### Aliases: leaderCluster

### ** Examples

  # A simple one-dimensional example
  points = 1:10
  out = leaderCluster(points, radius=2, distance="Lp", max_iter=1L)

  # A two-dimensional example
  par(mar=c(0,0,0,0), mfrow=c(1,3))
  set.seed(1)
  points = matrix(runif(100*2), ncol=2)
  for(r in c(0.1, 0.2, 0.4)) {
    out = leaderCluster(points = points, radius = r, distance="L2")$cluster_id
    cols = rainbow(length(unique(out)))[out]
    plot(points, pch=19, cex=0.7, col=cols, axes=FALSE)
    points(points[!duplicated(out),,drop=FALSE], cex=2, col=unique(cols))
    box()
  }



