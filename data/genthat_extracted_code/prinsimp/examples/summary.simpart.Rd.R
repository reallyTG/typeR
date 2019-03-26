library(prinsimp)


### Name: summary.simpart
### Title: Summary method for Simple Partition
### Aliases: summary.simpart print.summary.simpart
### Keywords: multivariate

### ** Examples

library(prinsimp)

## Caterpillar data: estimated covariance from Kingsolver et al (2004)
## Measurements are at temperatures 11, 17, 23, 29, 35, 40
data(caterpillar)

cat.sim <- simpart(caterpillar, simpledim = 2,
                   x = c(11, 17, 23, 29, 35, 40), cov = TRUE)
summary(cat.sim)

print(summary(cat.sim, loadings = TRUE), digits = 2)



