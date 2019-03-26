library(depth)


### Name: ctrmean
### Title: Centroid trimmed mean
### Aliases: ctrmean
### Keywords: multivariate nonparametric robust

### ** Examples

## exact centroid trimmed mean
set.seed(345)
xx <- matrix(rnorm(1000), nc = 2)
ctrmean(xx, .2)

## second example of an exact centroid trimmed mean
set.seed(159); library(MASS)
mu1 <- c(0,0); mu2 <- c(6,0); sigma <- matrix(c(1,0,0,1), nc = 2)
mixbivnorm <- rbind(mvrnorm(80, mu1 ,sigma), mvrnorm(20, mu2, sigma))
ctrmean(mixbivnorm, 0.3)

## dithering used for data set not in general position
data(starsCYG, package = "robustbase")
ctrmean(starsCYG, .1, mustdith = TRUE)



