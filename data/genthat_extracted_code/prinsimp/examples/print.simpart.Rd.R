library(prinsimp)


### Name: print.simpart
### Title: Print method for Simple Partition
### Aliases: print.simpart
### Keywords: multivariate

### ** Examples

library(prinsimp)

## Caterpillar data: estimated covariance from Kingsolver et al (2004)
## Measurements are at temperatures 11, 17, 23, 29, 35, 40
data(caterpillar)

cat.sim <- simpart(caterpillar, simpledim = 2,
                   x = c(11, 17, 23, 29, 35, 40), cov = TRUE)
print(cat.sim)



