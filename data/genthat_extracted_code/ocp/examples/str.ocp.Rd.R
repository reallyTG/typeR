library(ocp)


### Name: str.ocp
### Title: Object Structure
### Aliases: str.ocp

### ** Examples

simdatapts<- c(rnorm(n = 50), rnorm(n=50, 100))
ocpd1<- onlineCPD(simdatapts)
str(ocpd1)



