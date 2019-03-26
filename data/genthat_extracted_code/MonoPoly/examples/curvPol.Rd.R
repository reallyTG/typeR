library(MonoPoly)


### Name: curvPol
### Title: Evaluating the Curvature of Polynomials
### Aliases: curvPol
### Keywords: utilities regression

### ** Examples

beta <- c(1,2,1)

x <- 0:10
curvPol(x, beta)
str(curvPol(x, beta))

x <- cbind(0:10, 10:0)
curvPol(x, beta)
str(curvPol(x, beta))


x <- data.frame(x=0:10, y=10:0)
curvPol(x, beta)
str(curvPol(x, beta))



