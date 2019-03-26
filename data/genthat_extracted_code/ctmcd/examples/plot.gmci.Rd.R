library(ctmcd)


### Name: plot.gmci
### Title: Plot Function for Generator Matrix Confidence / Credibility
###   Interval Objects
### Aliases: plot.gmci

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
##D plot(gmem)
##D 
##D ## Confidence Interval
##D ciem=gmci(gmem,alpha=0.05)
##D plot(ciem)
## End(Not run)



