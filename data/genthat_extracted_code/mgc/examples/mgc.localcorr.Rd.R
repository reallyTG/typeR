library(mgc)


### Name: mgc.localcorr
### Title: MGC Local Correlations
### Aliases: mgc.localcorr

### ** Examples

library(mgc)

n=200; d=2
data <- mgc.sims.linear(n, d)
lcor <- mgc.localcorr(data$X, data$Y)




