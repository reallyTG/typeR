library(depth)


### Name: isodepth
### Title: Contour plots for depth functions
### Aliases: isodepth
### Keywords: multivariate nonparametric robust

### ** Examples

## exact contour plot with 10 contours
set.seed(601) ; x = matrix(rnorm(48), nc = 2)
isodepth(x)

## exact colored contours
set.seed(159); library(MASS)
mu1 <- c(0,0); mu2 <- c(6,0); sigma <- matrix(c(1,0,0,1), nc = 2)
mixbivnorm <- rbind(mvrnorm(80, mu1 ,sigma), mvrnorm(20, mu2, sigma))
isodepth(mixbivnorm, dpth = c(35,5), col = rainbow(2))

## vertices of each contour
set.seed(601)
x <- matrix(rnorm(48), nc = 2)
isodepth(x, output = TRUE)

## data set not in general position
data(starsCYG, package = "robustbase")
isodepth(starsCYG, mustdith = TRUE)

## colored contours
set.seed(601)
x <- matrix(rnorm(48), nc = 2)
isodepth(x, colcontours= rainbow(10))

# perspective plot
library(rgl)
set.seed(601)
x <- matrix(rnorm(48), nc = 2)
isodepth(x, twodim = FALSE)



