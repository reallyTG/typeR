library(mc2d)


### Name: empiricalD
### Title: The Discrete Empirical Distribution
### Aliases: empiricalD dempiricalD pempiricalD qempiricalD rempiricalD
### Keywords: distribution

### ** Examples

dempiricalD(1:6, 2:6, prob=c(10, 10, 70, 0, 10))
pempiricalD(1:6, 2:6, prob=c(10, 10, 70, 0, 10))
qempiricalD(seq(0, 1, 0.1), 2:6, prob=c(10, 10, 70, 0, 10))
table(rempiricalD(10000, 2:6, prob=c(10, 10, 70, 0, 10)))

## Varying values
(values <- matrix(1:10, ncol=5))
## the first x apply to the first row : p = 0.2
## the second x to the second one: p = 0
dempiricalD(c(1, 1), values)


##Use with mc2d
##Non Parameteric Bootstrap
val <- c(100, 150, 170, 200)
pr <- c(6, 12, 6, 6)
out <- c("min", "mean", "max")
##First Bootstrap in the uncertainty dimension
(x <- mcstoc(rempiricalD, type = "U", outm = out, nvariates = 30, values = val, prob = pr))
##Second one in the variability dimension
mcstoc(rempiricalD, type = "VU", values = x)






