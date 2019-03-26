library(gyriq)


### Name: gyriq-package
### Title: Kinship-Adjusted Survival SNP-Set Analysis
### Aliases: gyriq gyriq-package
### Keywords: package

### ** Examples

data(simGyriq)
for (i in seq_along(simGyriq)) assign(names(simGyriq)[i], simGyriq[[i]])

cr <- genComplResid(U, Delta, Phi, blkID, m=50, X)
testGyriq(cr$compResid, G, w, ker="LIN", asv=NULL, method="davies", 
starResid=NULL, bsw, tsw, pos)



