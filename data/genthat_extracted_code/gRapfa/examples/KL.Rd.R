library(gRapfa)


### Name: KL
### Title: Kullback-Leibler divergence for APFA models
### Aliases: KL

### ** Examples

library(gRapfa)
data(Wheeze)
samp <- sample(1:537, 250)
G <- select.IC(Wheeze[samp,])
G.fit  <- fit.APFA(G, Wheeze[-samp,])
kl <- KL(G, G.fit)



