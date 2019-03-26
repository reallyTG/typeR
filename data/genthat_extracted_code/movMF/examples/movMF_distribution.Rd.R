library(movMF)


### Name: movMF_distribution
### Title: Mixtures of von Mises-Fisher Distributions
### Aliases: dmovMF rmovMF vMF

### ** Examples

## To simulate from the vMF distribution with mean direction
## proportional to c(1, -1) and concentration parameter 3:
rmovMF(10, 3 * c(1, -1) / sqrt(2))
## To simulate from a mixture of vMF distributions with mean direction
## parameters c(1, 0) and c(0, 1), concentration parameters 3 and 4, and
## mixture probabilities 1/3 and 2/3, respectively:
rmovMF(10, c(3, 4) * rbind(c(1, 0), c(0, 1)), c(1, 2))



