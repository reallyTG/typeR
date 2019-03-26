library(ctmcd)


### Name: tmci
### Title: Delta Method Confidence Intervals for Matrix Exponential
###   Transformations of Generator Matrix Objects
### Aliases: tmci

### ** Examples

## Not run: 
##D data(tm_abs)
##D 
##D ## Maximum Likelihood Generator Matrix Estimate
##D gm0=matrix(1,8,8)
##D diag(gm0)=0
##D diag(gm0)=-rowSums(gm0)
##D gm0[8,]=0
##D 
##D gmem=gm(tm_abs,te=1,method="EM",gmguess=gm0)
##D 
##D ## 2.5 Year Transition Matrix Confidence Interval
##D citm=tmci(gmem,alpha=0.05,te=2.5)
##D citm
## End(Not run)



