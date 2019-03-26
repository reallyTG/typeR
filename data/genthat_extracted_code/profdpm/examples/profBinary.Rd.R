library(profdpm)


### Name: profBinary
### Title: Binary Product Partition Models
### Aliases: profBinary

### ** Examples

library(profdpm)
set.seed(42)

# simulate two clusters of multivariate binary data
p <- seq(0.9,0.1,length.out=3)
y1 <- matrix(rbinom(333, 1, p), 111, 3, TRUE)
y2 <- matrix(rbinom(333, 1, rev(p)), 111, 3, TRUE)
dat <- as.data.frame(rbind(y1, y2))

# fit the PPM
fitb <- profBinary(~0+., data=dat)

# plot the data ordered by cluster
image(t(as.matrix(fitb$model)[order(fitb$clust),]),
      xaxt="n", yaxt="n", col=0:1)
axis(3, labels=paste("V", 1:3, sep=""), at=0:2/2)

# plot the data ordered and colored by cluster
image(t(as.matrix(fitb$model) * fitb$clust)[, order(fitb$clust)],
      xaxt="n", yaxt="n", col=0:length(unique(fitb$clust)))
axis(3, labels=paste("V", 1:3, sep=""), at=0:2/2)



