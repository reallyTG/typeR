library(MonoPoly)


### Name: ismonotone
### Title: Check whether a polynomial is monotone
### Aliases: ismonotone ismonotone.monpol ismonotone.default
### Keywords: utilities

### ** Examples

  fit <- monpol(y~x, w0)
  ismonotone(fit)

  beta <- c(1,0,2)  ## the polynomial 1 + 2*x^2
  ismonotone(beta)
  ismonotone(beta, a=0)
  ismonotone(beta, b=0)



