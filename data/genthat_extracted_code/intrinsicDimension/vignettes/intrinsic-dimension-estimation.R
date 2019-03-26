## ------------------------------------------------------------------------
library(intrinsicDimension)

## ------------------------------------------------------------------------
local.data <- cutHyperPlane(Ns = 30, d = 50, n = 100, sd = 0.01)
essLocalDimEst(local.data, ver = 'a')
maxLikLocalDimEst(local.data)
maxLikLocalDimEst(local.data, dnoise='dnoiseGaussH', sigma=0.01, n=100)
pcaLocalDimEst(local.data, ver = 'FO')

## ------------------------------------------------------------------------
manifold.data <- swissRoll(500) 
maxLikGlobalDimEst(manifold.data, k=10, unbiased = TRUE)
maxLikGlobalDimEst(manifold.data, k=10, unbiased = TRUE, neighborhood.aggregation = 'robust')
dancoDimEst(manifold.data, k=10, D=10)
N <- dim(manifold.data)[1]
k <- 2
ps <- seq(max(k + 1, round(N/2)), N - 1, length.out = 5)
knnDimEst(manifold.data, k, ps, M = 10, gamma = 2)

maxLikPointwiseDimEst(manifold.data, k=10, unbiased = TRUE)
pcaOtpmPointwiseDimEst(manifold.data, 10)

## ---- fig.show='hold', fig.width=6, fig.height=4-------------------------
data <- swissRoll3Sph(300, 300)
essPointwiseDimEst <- asPointwiseEstimator(essLocalDimEst, neighborhood.size=10,
                                           indices = c(1:10, 301:310))
ess.pw.res <- essPointwiseDimEst(data)

palette <- c('#11FF1111', '#FF111111')
hist(ess.pw.res$dim.est[1:10], breaks=seq(0, max(ess.pw.res$dim.est)+1, by=0.5),
     col=palette[1], main='ESS pointwise dimension estimation', xlab='')
hist(ess.pw.res$dim.est[11:20], breaks=seq(0, max(ess.pw.res$dim.est)+1, by=0.5),
     add=TRUE, col=palette[2])
legend('topright', c('Swiss roll (2D)', '3-sphere (3D)'), fill=palette)

max.lik.pw.res <- maxLikPointwiseDimEst(data, k=10, indices = c(1:10, 301:310))
hist(max.lik.pw.res$dim.est[1:10], breaks=seq(0, max(max.lik.pw.res$dim.est)+1, by=0.5),
     col=palette[1], main='ML pointwise dimension estimation', xlab='')
hist(max.lik.pw.res$dim.est[11:20], breaks=seq(0, max(max.lik.pw.res$dim.est)+1, by=0.5),
     add=TRUE, col=palette[2])
legend('topright', c('Swiss roll (2D)', '3-sphere (3D)'), fill=palette)

