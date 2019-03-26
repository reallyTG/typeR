library(gyriq)


### Name: simGyriq
### Title: Simulated SNP-set
### Aliases: simGyriq
### Keywords: dataset

### ** Examples

data(simGyriq)
for (i in seq_along(simGyriq)) assign(names(simGyriq)[i], simGyriq[[i]])

cr <- genComplResid(U, Delta, Phi, blkID, m=50, X)
testGyriq(cr$compResid, G, w, ker="LIN", asv=NULL, method="davies", 
starResid=NULL, bsw, tsw, pos)



