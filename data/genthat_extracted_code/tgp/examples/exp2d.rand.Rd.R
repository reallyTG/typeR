library(tgp)


### Name: exp2d.rand
### Title: Random 2-d Exponential Data
### Aliases: exp2d.rand
### Keywords: datasets datagen

### ** Examples

## randomly subsampled data
## ------------------------

eds <- exp2d.rand()

# higher span = 0.5 required because the data is sparse
# and was generated randomly
eds.g <- interp.loess(eds$X[,1], eds$X[,2], eds$Z, span=0.5)

# perspective plot, and plot of the input (X & XX) locations
par(mfrow=c(1,2), bty="n")
persp(eds.g, main="loess surface", theta=-30, phi=20,
      xlab="X[,1]", ylab="X[,2]", zlab="Z")
plot(eds$X, main="Randomly Subsampled Inputs")
points(eds$XX, pch=19, cex=0.5)

## Latin Hypercube sampled data
## ----------------------------

edlh <- exp2d.rand(lh=c(20, 15, 10, 5))

# higher span = 0.5 required because the data is sparse
# and was generated randomly
edlh.g <- interp.loess(edlh$X[,1], edlh$X[,2], edlh$Z, span=0.5)

# perspective plot, and plot of the input (X & XX) locations
par(mfrow=c(1,2), bty="n")
persp(edlh.g, main="loess surface", theta=-30, phi=20,
      xlab="X[,1]", ylab="X[,2]", zlab="Z")
plot(edlh$X, main="Latin Hypercube Sampled Inputs")
points(edlh$XX, pch=19, cex=0.5)

# show the quadrants
abline(h=2, col=2, lty=2, lwd=2)
abline(v=2, col=2, lty=2, lwd=2)


## Not run: 
##D ## D-optimal subsample with a factor of 10 (more) candidates
##D ## ---------------------------------------------------------
##D 
##D edlhd <- exp2d.rand(lh=c(20, 15, 10, 5), dopt=10)
##D 
##D # higher span = 0.5 required because the data is sparse
##D # and was generated randomly
##D edlhd.g <- interp.loess(edlhd$X[,1], edlhd$X[,2], edlhd$Z, span=0.5)
##D 
##D # perspective plot, and plot of the input (X & XX) locations
##D par(mfrow=c(1,2), bty="n")
##D persp(edlhd.g, main="loess surface", theta=-30, phi=20,
##D       xlab="X[,1]", ylab="X[,2]", zlab="Z")
##D plot(edlhd$X, main="D-optimally Sampled Inputs")
##D points(edlhd$XX, pch=19, cex=0.5)
##D 
##D # show the quadrants
##D abline(h=2, col=2, lty=2, lwd=2)
##D abline(v=2, col=2, lty=2, lwd=2)
## End(Not run)



