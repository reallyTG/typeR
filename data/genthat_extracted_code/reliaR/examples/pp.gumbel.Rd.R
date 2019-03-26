library(reliaR)


### Name: pp.gumbel
### Title: Probability versus Probability (PP) plot for the Gumbel
###   distribution
### Aliases: pp.gumbel
### Keywords: hplot

### ** Examples

## Load data sets
data(dataset2)
## Maximum Likelihood(ML) Estimates of mu & sigma for the data(dataset2)
## Estimates of mu & sigma using 'maxLik' package
## mu.est = 212.157, sigma.est = 151.768

pp.gumbel(dataset2, 212.157, 151.768, main = " ", line = TRUE)



