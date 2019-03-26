library(depth)


### Name: med
### Title: Multivariate median
### Aliases: med
### Keywords: multivariate nonparametric robust

### ** Examples

## exact Tukey median for a mixture of bivariate normals
set.seed(159); library(MASS)
mu1 <- c(0,0); mu2 <- c(6,0); sigma <- matrix(c(1,0,0,1), nc = 2)
mixbivnorm <- rbind(mvrnorm(80, mu1, sigma), mvrnorm(20, mu2, sigma))
med(mixbivnorm)

##  approximate Tukey median of a four-dimensional data set
set.seed(601)
zz <- matrix(rnorm(96), nc = 4)
med(zz)

## data set not in general position
data(starsCYG, package = "robustbase")
med(starsCYG, method = "Liu")

## use of dithering for the Tukey median
med(starsCYG, mustdith = TRUE)



