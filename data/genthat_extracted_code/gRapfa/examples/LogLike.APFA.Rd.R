library(gRapfa)


### Name: LogLike.APFA
### Title: Log likelihood for an APFA model
### Aliases: LogLike.APFA

### ** Examples

library(gRapfa)
data(Wheeze)
G <- st(Wheeze)
samp <- sample(1:537, 250)
G <- select.IC(Wheeze[samp,])
G.LL  <- LogLike.APFA(G, Wheeze[-samp,])



