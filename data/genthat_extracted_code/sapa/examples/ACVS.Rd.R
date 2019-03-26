library(sapa)


### Name: ACVS
### Title: Autocovariance sequence
### Aliases: ACVS
### Keywords: univar

### ** Examples

## calculate the ACVS for an N(0,1) realization 
plot(seq(0,99), ACVS(rnorm(100)), type="l", lwd=2,
    xlab="lag",ylab="ACVS(rnorm(100))")
ifultools::gridOverlay()



