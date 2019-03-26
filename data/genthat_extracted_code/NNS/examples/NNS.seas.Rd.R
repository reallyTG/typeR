library(NNS)


### Name: NNS.seas
### Title: NNS Seasonality Test
### Aliases: NNS.seas
### Keywords: seasonality

### ** Examples

set.seed(123)
x <- rnorm(100)

## To call strongest period based on coefficient of variance:
NNS.seas(x)$best.period



