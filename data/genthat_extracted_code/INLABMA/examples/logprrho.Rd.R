library(INLABMA)


### Name: logprrho
### Title: Log-prior density for the spatial autocorrelation parameter
###   'rho'
### Aliases: logprrho
### Keywords: distribution

### ** Examples


rrho<-seq(.01, .99, length.out=100)
plot(rrho, exp(logprrho(rrho)))



