library(NNS)


### Name: UPM.VaR
### Title: UPM VaR
### Aliases: UPM.VaR
### Keywords: VaR

### ** Examples

set.seed(123)
x <- rnorm(100)

## For 95th percentile VaR (right-tail)
UPM.VaR(0.95, 0, x)



