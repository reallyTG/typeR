library(metaBMA)


### Name: dtriangular
### Title: Triangular Distribution
### Aliases: dtriangular rtriangular

### ** Examples

plot(prior("triangular", c(.2, .6, 1.3)), 0, 2)

samples <- rtriangular(1e5, .2, .5, 1)
hist(samples, 200, FALSE)
curve(dtriangular(x, .2, .5, 1), col = 2,
      add = TRUE, lwd = 2)



