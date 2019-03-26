library(ocp)


### Name: onlineCPD
### Title: Bayesian Online Changepoint Detection
### Aliases: onlineCPD

### ** Examples

simdatapts<- c(rnorm(n = 50), rnorm(n=50, 100))
ocpd1<- onlineCPD(simdatapts)
ocpd1$changepoint_lists # view the changepoint lists



