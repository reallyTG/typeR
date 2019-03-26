library(NNS)


### Name: LPM.VaR
### Title: LPM VaR
### Aliases: LPM.VaR
### Keywords: Confidence Interval VaR,

### ** Examples

set.seed(123)
x <- rnorm(100)

## For 95th percentile VaR (left-tail)
LPM.VaR(0.95, 0, x)



