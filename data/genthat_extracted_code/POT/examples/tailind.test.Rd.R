library(POT)


### Name: tailind.test
### Title: Testing for Tail Independence in Extreme Value Models
### Aliases: tailind.test
### Keywords: htest

### ** Examples

##A total independence example
x <- rbvgpd(7000, alpha = 1, mar1 = c(0, 1, 0.25))
tailind.test(x)
##An asymptotically dependent example
y <- rbvgpd(7000, alpha = 0.75, model = "nlog", mar1 = c(0, 1, 0.25),
mar2 = c(2, 0.5, -0.15))
tailind.test(y)
##A perfect dependence example
z <- rnorm(7000)
tailind.test(cbind(z, 2*z - 5))



