library(secr)


### Name: ip.secr
### Title: Spatially Explicit Capture-Recapture by Inverse Prediction
### Aliases: ip.secr pfn
### Keywords: models

### ** Examples


## Not run: 
##D ## these calculations may take several minutes
##D 
##D ## default settings
##D ip.secr (captdata)
##D 
##D ## coarse initial fit, no variance step
##D ip1 <- ip.secr (captdata, boxsize = 0.2, CVmax=0.01, var=0)
##D ## refined fit
##D ip2 <- ip.secr (captdata, start = ip1$IP[,"estimate"],
##D     boxsize = 0.1, CVmax=0.002, var=1000)
##D ip2
##D 
##D ## compare to MLE of same data using multi-catch assumption
##D predict(secrdemo.0)
##D 
##D ## improvise another predictor function (dbar instead of RPSV)
##D pfn2 <- function (capthist, v) {  ## v is not used
##D     sumni <- sum(capthist!=0)   ## total detections
##D     n <- nrow(capthist)         ## number of individuals
##D     nocc <- ncol(capthist)      ## number of occasions
##D     c(N = n, p = sumni/n/nocc, dbar = dbar(capthist))
##D }
##D ip.secr (captdata, predictorfn = pfn2)
## End(Not run)



