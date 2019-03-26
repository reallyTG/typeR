library(bda)


### Name: fit.mixnorm
### Title: Fit a Normal Mixture Model to binned data
### Aliases: fit.mixnorm fit.mixnorm.default fit.mixnorm.bdata
###   fit.mixnorm.histogram print.nmix plot.nmix lines.nmix pdf.nmix
###   cdf.nmix
### Keywords: smooth

### ** Examples


 y <- c(10, 21, 56,79,114,122,110,85,85,61,47,49,47,44,31,20,11,4,4)
 x <- 14.5 + c(0:length(y))
 x.hist <- binning(counts=y, breaks=x)
 mu <- c(20.0, 26.0)
 p <- c(0.5, 0.5)
 sig <- c(2.0, 2.8)
 out <- fit.mixnorm(x.hist,mu=mu, p=p, s=sig)




