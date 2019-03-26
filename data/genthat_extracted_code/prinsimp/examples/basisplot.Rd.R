library(prinsimp)


### Name: basisplot
### Title: Basisplot method for Simple Partition
### Aliases: basisplot
### Keywords: multivariate

### ** Examples

library(prinsimp)
require(graphics)

## Caterpillar estimated covariance from Kingsolver et al (2004)
## Measurements are at times 11, 17, 23, 29, 35, 40
data(caterpillar)

cat.sim <- simpart(caterpillar, simpledim = 2,
                   x = c(11, 17, 23, 29, 35, 40), cov = TRUE)

## Plots the 4 model basis vectors and 2 simplicity basis vectors consecutively
basisplot(cat.sim)
    
## Display the 4 model basis vectors on one page
par(mfrow = c(2,2))
basisplot(cat.sim, display = list(model=1:4))



