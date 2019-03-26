library(spatialkernel)


### Name: spatialkernel-package
### Title: The Spatialkernel Package
### Aliases: spatialkernel-package spatialkernel
### Keywords: package

### ** Examples

## An example of spatial segregation analysis
  ## source in Lansing Woods tree data within a polygon boundary
  data(lansing)
  data(polyb)
  ## select data points within polygon
  ndx <- which(pinpoly(polyb, as.matrix(lansing[c("x", "y")])) > 0)
  pts <- as.matrix(lansing[c("x", "y")])[ndx,]
  marks <- lansing[["marks"]][ndx]
  ## select bandwidth
  #In a real application you may want to set 'length' to a higher value.
  h <- seq(0.02, 0.1, length=11)
  cv <- cvloglk(pts, marks, h=h)$cv
  hcv <- h[which.max(cv)]
  plot(h, cv, type="l")
  ## estimate type-specific probabilities and do segregation tests
  ## by one integrated function
  #
  # In a real application, set 'ntest' to 99 or a larger number.
  sp <- spseg(pts, marks, hcv, opt=3, ntest=5, poly=polyb)
  ## plot estimated type-specific probability surfaces
  plotphat(sp)
  ## additional with pointwise significance contour lines
  plotmc(sp, quan=c(0.025, 0.975))
  ## p-value of the Monte Carlo segregation test
  cat("\np-value of the Monte Carlo segregation test", sp$pvalue)
  
  ##estimate intensity function at grid point for presentation
  ##with bandwidth hcv
  gridxy <- as.matrix(expand.grid(x=seq(0, 1, length=41), y=seq(0, 1, length=41)))
  ndx <- which(pinpoly(polyb, gridxy) > 0) ##inside point index
  lam <- matrix(NA, ncol = 41, nrow = 41)
  lam[ndx] <- lambdahat(pts, hcv, gpts = gridxy[ndx,], poly =
      polyb)$lambda
  brks <- pretty(range(lam, na.rm=TRUE), n=12)
  plot(0, 0, xlim=0:1, ylim=0:1, xlab="x", ylab="y", type="n")
  image(x=seq(0, 1, length=41), y=seq(0, 1, length=41),
    z=lam, add=TRUE, breaks=brks, col=risk.colors(length(brks)-1))
  polygon(polyb)
  metre(0, 0.01, 0.05, 0.51, lab=brks, col=risk.colors(length(brks)-1), cex=1)
  
  ## An example of inhomogeneous intensity function and K function
  ## estimated with the same data
  s <- seq(0, 0.06, length=51)
  lam <- lambdahat(pts, hcv, poly=polyb)$lambda
  kin <- kinhat(pts, lam, polyb, s)
  plot(kin$s, kin$k-pi*(kin$s)^2, xlab="s", ylab="k-pi*s^2", type="l")



