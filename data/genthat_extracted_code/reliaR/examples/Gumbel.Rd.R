library(reliaR)


### Name: Gumbel
### Title: The Gumbel distribution
### Aliases: Gumbel dgumbel pgumbel qgumbel rgumbel
### Keywords: distribution

### ** Examples

## Load data sets
data(dataset2)
## Maximum Likelihood(ML) Estimates of mu & sigma for the data(dataset2)
## Estimates of mu & sigma using 'maxLik' package
## mu.est = 212.157, sigma.est = 151.768

dgumbel(dataset2, 212.157, 151.768, log = FALSE)
pgumbel(dataset2, 212.157, 151.768, lower.tail = TRUE, log.p = FALSE)
qgumbel(0.25, 212.157, 151.768, lower.tail=TRUE, log.p = FALSE)
rgumbel(30, 212.157, 151.768)



