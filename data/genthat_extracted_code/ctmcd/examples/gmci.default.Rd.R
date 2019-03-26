library(ctmcd)


### Name: gmci.default
### Title: Confidence / Credibility Intervals for Generator Matrix Objects
### Aliases: gmci.default ciEMBS ciEMSdR ciEMoFI ciEMDM ciGS

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
##D ## Oakes Confidence Interval
##D ciem=gmci(gmem,alpha=0.05)
##D ciem
## End(Not run)



