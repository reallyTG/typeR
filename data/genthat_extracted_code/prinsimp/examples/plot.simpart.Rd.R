library(prinsimp)


### Name: plot.simpart
### Title: Plot method for Simple Partition
### Aliases: plot.simpart
### Keywords: multivariate

### ** Examples

library(prinsimp)
require(graphics)

## Caterpillar estimated covariance matrix from Kingsolver et al (2004)
## Measurements are at temperatures 11, 17, 23, 29, 35, 40
data(caterpillar)

## Default plot method for a 2-dimensional nearly null space
cat.sim <- simpart(caterpillar, simpledim = 2,
                   x = c(11, 17, 23, 29, 35, 40), cov = TRUE)
plot(cat.sim)

## Plot only the two simplicity basis vectors in the 2-dimensional
## nearly null space
plot(cat.sim, display = list(simple=1:2))
    
## Try, by mistake to plot first four simple vectors when simpledim=2.
## Will plot only 2.
plot(cat.sim, display = list(simple=1:4))

## Only plot the first two model basis vectors, the variance simplicity
## view, and the percent variance explained panel using the 'layout'
## argument
plot(cat.sim, display = list(model=1:2), layout = matrix(1:4, nrow=2, ncol=2))



