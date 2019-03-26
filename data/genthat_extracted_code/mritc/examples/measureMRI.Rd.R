library(mritc)


### Name: measureMRI
### Title: Compare the Predicted Classsification Results with the Truth
### Aliases: measureMRI
### Keywords: utilities

### ** Examples

  #Example 1
  prop <- c(.3, .4, .3)
  mu <- c(-4, 0, 4)
  sigma <- rep(1, 3)
  y <- rnormmix(n=1e4, prop, mu, sigma)
  intvec <- y[,1]
  actual <- y[,2]
  pre <- actual
  pre[sample(1:1e4, 100, replace=FALSE)]  <- sample(1:3, 100, replace=TRUE)
  actual <- do.call(cbind, lapply(1:3, function(i) ifelse(actual==i, 1, 0)))
  pre <- do.call(cbind, lapply(1:3, function(i) ifelse(pre==i, 1, 0)))
  measureMRI(intvec, actual, pre)

   ## Not run: 
##D   #Example 2
##D   T1 <- readMRI(system.file("extdata/t1.rawb.gz", package="mritc"),
##D                 c(91,109,91), format="rawb.gz")
##D   mask <-readMRI(system.file("extdata/mask.rawb.gz", package="mritc"),
##D                  c(91,109,91), format="rawb.gz")
##D   tc.icm <- mritc(T1, mask, method="ICM")
##D 
##D   csf <- readMRI(system.file("extdata/csf.rawb.gz", package="mritc"),
##D                 c(91,109,91), format="rawb.gz")
##D   gm <- readMRI(system.file("extdata/gm.rawb.gz", package="mritc"),
##D                 c(91,109,91), format="rawb.gz")
##D   wm <- readMRI(system.file("extdata/wm.rawb.gz", package="mritc"),
##D                 c(91,109,91), format="rawb.gz")
##D   truth <- cbind(csf[mask==1], gm[mask==1], wm[mask==1])
##D   truth <- truth/255
##D   measureMRI(T1[mask==1], truth, tc.icm$prob)
##D   
## End(Not run)



