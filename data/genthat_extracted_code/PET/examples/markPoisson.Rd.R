library(PET)


### Name: markPoisson
### Title: Marked Poisson Process
### Aliases: markPoisson
### Keywords: math smooth

### ** Examples

## Not run: 
##D P <- phantom()
##D rP <- radon(P)
##D mP1 <- markPoisson(P)
##D mP2 <- markPoisson(P, nSample = 1000000)
##D viewData(list(P, mP1$Data, mP2$Data, rP$rData, mP1$rData, mP2$rData),
##D          list("Phantom", "nSample = 200000", "nSample = 1000000",
##D               "Radon Transfom of Phantom",  "nSample = 200000", 
##D               "nSample = 1000000"))
##D cat("Number of generated accepted events for mP2:",sum(mP2$Data),"\n")
##D rm(mP1,mP2,P,rP)
## End(Not run)



