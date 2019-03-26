library(verification)


### Name: probcont2disc
### Title: Converts continuous probability values into binned discrete
###   probability forecasts.
### Aliases: probcont2disc
### Keywords: file

### ** Examples


#  probabilistic/ binary example

set.seed(1)
x <- runif(10) ## simulated probabilities.

probcont2disc(x)
probcont2disc(x, bins = seq(0,1,0.25) )

## probcont2disc(4, bins = seq(0,1,0.3)) ## gets error




