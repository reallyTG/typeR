library(robustHD)


### Name: corHuber
### Title: Robust correlation based on winsorization.
### Aliases: corHuber
### Keywords: multivariate robust

### ** Examples

## generate data
library("mvtnorm")
set.seed(1234)  # for reproducibility
Sigma <- matrix(c(1, 0.6, 0.6, 1), 2, 2)
xy <- rmvnorm(100, sigma=Sigma)
x <- xy[, 1]
y <- xy[, 2]

## introduce outlier
x[1] <- x[1] * 10
y[1] <- y[1] * (-5)

## compute correlation
cor(x, y)
corHuber(x, y)



