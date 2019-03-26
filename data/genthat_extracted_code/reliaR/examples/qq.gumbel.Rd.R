library(reliaR)


### Name: qq.gumbel
### Title: Quantile versus quantile (QQ) plot for the Gumbel distribution
### Aliases: qq.gumbel
### Keywords: hplot

### ** Examples

## Load data sets
data(dataset2)
## Maximum Likelihood(ML) Estimates of mu & sigma for the data(dataset2)
## Estimates of mu & sigma using 'maxLik' package
## mu.est = 212.157, sigma.est = 151.768

qq.gumbel(dataset2, 212.157, 151.768, main = " ", line.qt = FALSE)



