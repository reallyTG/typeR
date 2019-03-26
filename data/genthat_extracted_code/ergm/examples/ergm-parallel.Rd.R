library(ergm)


### Name: ergm-parallel
### Title: Parallel Processing in the 'ergm' Package
### Aliases: ergm-parallel parallel ergm.parallel parallel.ergm
###   parallel-ergm ergm.getCluster ergm.stopCluster
###   ergm.stopCluster.default

### ** Examples


## No test: 
# Uses 2 SOCK clusters for MCMLE estimation
data(faux.mesa.high)
nw <- faux.mesa.high
fauxmodel.01 <- ergm(nw ~ edges + isolates + gwesp(0.2, fixed=TRUE), 
                     control=control.ergm(parallel=2, parallel.type="PSOCK"))
summary(fauxmodel.01)

## End(No test)




