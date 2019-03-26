library(ocp)


### Name: summary.ocp
### Title: Object Summary
### Aliases: summary.ocp

### ** Examples

simdatapts<- c(rnorm(n = 50), rnorm(n=50, 100))
ocpd1<- onlineCPD(simdatapts)
summary(ocpd1)



