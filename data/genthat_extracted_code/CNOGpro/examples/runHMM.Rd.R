library(CNOGpro)


### Name: runHMM
### Title: Copy number variation inference through a Hidden Markov Model
### Aliases: runHMM

### ** Examples

data(carsonella)
carsonella_normalized <- normalizeGC(carsonella)
carsonella_hmm <- runHMM(carsonella_normalized)
plotCNOGpro(carsonella_hmm)



