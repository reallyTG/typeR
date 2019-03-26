library(condvis)


### Name: savingby2d
### Title: Assess advantage of 2-D view over 1-D view for identifying
###   extrapolation
### Aliases: savingby2d

### ** Examples

x <- runif(1000)
y <- runif(1000)
plot(x, y)
savingby2d(x, y)
## value near 1, no real benefit from bivariate view

x1 <- runif(1000)
y1 <- x1 + rnorm(sd = 0.3, n = 1000)
plot(x1, y1)
savingby2d(x1, y1)
## smaller value indicates that the bivariate view reveals some structure




