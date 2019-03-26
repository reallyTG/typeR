library(prinsimp)


### Name: varperc
### Title: Varperc method for Simple Partition
### Aliases: varperc
### Keywords: multivariate

### ** Examples

library(prinsimp)
require(graphics)

## Caterpillar estimated covariance from Kingsolver et al (2004)
## Measurements are at times 11, 17, 23, 29, 35, 40
data(caterpillar)

cat.sim <- simpart(caterpillar, simpledim = 2,
                 x = c(11, 17, 23, 29, 35, 40), cov = TRUE)

varperc(cat.sim)



