library(gRapfa)


### Name: fit.APFA
### Title: Fitting an APFA igraph object to data
### Aliases: fit.APFA

### ** Examples

library(gRapfa)
data(Wheeze)
samp <- sample(1:537, 250)
G <- select.IC(Wheeze[samp,])
G.fit  <- fit.APFA(G, Wheeze[-samp,])



