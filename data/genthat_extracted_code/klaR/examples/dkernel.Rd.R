library(klaR)


### Name: dkernel
### Title: Estimate density of a given kernel
### Aliases: dkernel
### Keywords: distribution nonparametric

### ** Examples

kern <- density(rnorm(50))
x <- seq(-3, 3, len = 100)
y <- dkernel(x, kern)
plot(x, y, type = "l")



