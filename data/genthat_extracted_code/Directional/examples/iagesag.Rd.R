library(Directional)


### Name: Hypothesis test for IAG distribution over the ESAG distribution
### Title: Hypothesis test for IAG distribution over the ESAG distribution
### Aliases: iagesag
### Keywords: Goodness of fit test von Mises-Fisher distribution Kent
###   distribution

### ** Examples

x <- rvmf(100, rnorm(3), 15)
iagesag(x)
fishkent(x, B = 1)



