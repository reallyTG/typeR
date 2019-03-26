library(mgc)


### Name: mgc.sample
### Title: MGC Sample
### Aliases: mgc.sample

### ** Examples

library(mgc)

n=200; d=2
data <- mgc.sims.linear(n, d)
lcor <- mgc.sample(data$X, data$Y)




