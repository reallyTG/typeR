library(CNOGpro)


### Name: plotCNOGpro
### Title: Plots the results of a 'CNOGpro' experiment
### Aliases: plotCNOGpro

### ** Examples

data(carsonella)
carsonella_normalized <- normalizeGC(carsonella)
carsonella_hmm <- runHMM(carsonella_normalized, nstates=5)
plotCNOGpro(carsonella_hmm)



