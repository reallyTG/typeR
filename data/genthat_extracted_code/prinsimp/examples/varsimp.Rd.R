library(prinsimp)


### Name: varsimp
### Title: Varsimp method for Simple Partition
### Aliases: varsimp
### Keywords: multivariate

### ** Examples

library(prinsimp)
require(graphics)

## Caterpillar estimated covariance from Kingsolver et al (2004)
## Measurements are at times 11, 17, 23, 29, 35, 40
data(caterpillar)

cat.sim <- simpart(caterpillar, simpledim = 2,
                   x = c(11, 17, 23, 29, 35, 40), cov = TRUE)

## Display all 6 basis vectors in the variance-simplicity view
varsimp(cat.sim)
    
## Display only the 4 model basis vectors in the variance-simplicity view
varsimp(cat.sim, display = list(model=1:4))



