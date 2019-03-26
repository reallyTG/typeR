library(DRR)


### Name: drr
### Title: Dimensionality Reduction via Regression
### Aliases: drr

### ** Examples

tt <- seq(0,4*pi, length.out = 200)
helix <- cbind(
  x = 3 * cos(tt) + rnorm(length(tt), sd = seq(0.1, 1.4, length.out = length(tt))),
  y = 3 * sin(tt) + rnorm(length(tt), sd = seq(0.1, 1.4, length.out = length(tt))),
  z = 2 * tt      + rnorm(length(tt), sd = seq(0.1, 1.4, length.out = length(tt)))
)
helix <- helix[sample(nrow(helix)),] # shuffling data is important!!
system.time(
drr.fit  <- drr(helix, ndim = 3, cv.folds = 4,
                lambda = 10^(-2:1),
                kernel.pars = list(sigma = 10^(0:3)),
                fastkrr.nblocks = 2, verbose = TRUE,
                fastcv = FALSE)
)

## Not run: 
##D library(rgl)
##D plot3d(helix)
##D points3d(drr.fit$inverse(drr.fit$fitted.data[,1,drop = FALSE]), col = 'blue')
##D points3d(drr.fit$inverse(drr.fit$fitted.data[,1:2]),             col = 'red')
##D 
##D plot3d(drr.fit$fitted.data)
##D pad <- -3
##D fd <- drr.fit$fitted.data
##D xx <- seq(min(fd[,1]),       max(fd[,1]),       length.out = 25)
##D yy <- seq(min(fd[,2]) - pad, max(fd[,2]) + pad, length.out = 5)
##D zz <- seq(min(fd[,3]) - pad, max(fd[,3]) + pad, length.out = 5)
##D 
##D dd <- as.matrix(expand.grid(xx, yy, zz))
##D plot3d(helix)
##D for(y in yy) for(x in xx)
##D   rgl.linestrips(drr.fit$inverse(cbind(x, y, zz)), col = 'blue')
##D for(y in yy) for(z in zz)
##D   rgl.linestrips(drr.fit$inverse(cbind(xx, y, z)), col = 'blue')
##D for(x in xx) for(z in zz)
##D   rgl.linestrips(drr.fit$inverse(cbind(x, yy, z)), col = 'blue')
## End(Not run)




