library(reliaR)


### Name: ks.gumbel
### Title: Test of Kolmogorov-Smirnov for the Gumbel distribution
### Aliases: ks.gumbel
### Keywords: htest

### ** Examples

## Load data sets
data(dataset2)
## Maximum Likelihood(ML) Estimates of mu & sigma for the data(dataset2)
## Estimates of mu & sigma using 'maxLik' package
## mu.est = 212.157, sigma.est = 151.768

ks.gumbel(dataset2, 212.157, 151.768, alternative = "two.sided", plot = TRUE)



