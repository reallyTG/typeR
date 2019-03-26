library(depth)


### Name: perspdepth
### Title: Perspective plots for depth functions
### Aliases: perspdepth
### Keywords: multivariate nonparametric robust

### ** Examples

## 2 perspective plots
data(geyser, package = "MASS")
perspdepth(geyser, col = "magenta")
set.seed(159); library(MASS)
mu1 <- c(0,0); mu2 <- c(6,0); sigma <- matrix(c(1,0,0,1), nc = 2)
mixbivnorm <- rbind(mvrnorm(80, mu1, sigma),mvrnorm(20, mu2, sigma))
perspdepth(mixbivnorm, col = "chartreuse")

## grid coordinates and corresponding depth values
set.seed(601)
x <- matrix(rnorm(48), nc = 2)
perspdepth(x, output = TRUE, tt = 10)



