library(Rdistance)


### Name: smu.like
### Title: Smoothed likelihood function for distance analyses
### Aliases: smu.like
### Keywords: models

### ** Examples

 
set.seed(238642)
d <- abs(rnorm(100))
dfunc <- dfuncSmu(d~1)

L <- smu.like(a=dfunc$parameters, 
       dist=dfunc$dist, 
       w.lo=dfunc$w.lo, 
       w.hi=dfunc$w.hi, 
       scale=TRUE)
-sum(log(L), na.rm=TRUE)  # the negative log likelihood




