library(fgpt)


### Name: fgeasy
### Title: Single step version of the Floating Grid Permutation Technique
### Aliases: fgeasy summary.fg plot.fg

### ** Examples

## A simple univariate example
##
## Produce 49 geographical locations in a regular grid.
loc.x <- rep(1:7,7)
loc.y <- rep(1:7, each=7)

## Produce 49 observations with negative spatial autocorrelation.
marks <- c(rep(c(1,2), 24),1)+rnorm(49,0,0.1)

fg1 <- fgeasy(xy=cbind(loc.x,loc.y), marks=marks, iter=99)
summary(fg1)
plot(fg1)

## An example for two paired marks
##
## Produce 20 geographical locations.
loc.x <- 1:20
loc.y <- runif(20,0,5)

## Produce 2 x 20 phenotypes.
type1 <- 11:30+runif(20,0,5)
type2 <- 11:30+runif(20,0,5)

fg2 <- fgeasy(xy=cbind(loc.x,loc.y), marks=cbind(type1,type2), iter=99, 
        pairwise=TRUE, correlate="pearson")
summary(fg2)
plot(fg2)
  


