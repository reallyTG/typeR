library(depth)


### Name: depth
### Title: Depth calculation
### Aliases: depth
### Keywords: multivariate nonparametric robust

### ** Examples
## calculation of Tukey depth
data(starsCYG, package = "robustbase")
depth(apply(starsCYG,2,mean), starsCYG)

## Tukey depth applied to a large bivariate data set.
set.seed(356)
x <- matrix(rnorm(9999), nc = 3)
depth(rep(0,3), x)

## approximate calculation much easier
depth(rep(0,3), x, approx = TRUE)



