library(CNOGpro)


### Name: runBootstrap
### Title: Gene copy numbers with confidence intervals through
###   bootstrapping
### Aliases: runBootstrap

### ** Examples

data(carsonella)
carsonella_normalized <- normalizeGC(carsonella)
carsonella_bootstrapped <- runBootstrap(carsonella, replicates=500)
printCNOGpro(carsonella_bootstrapped)



