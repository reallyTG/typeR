library(LDOD)


### Name: cfisher
### Title: Auto-constructing Fisher Information matrix
### Aliases: cfisher
### Keywords: optimal design Fisher information matrix

### ** Examples

## Logistic dose response model
ymean <- "(1/(exp(-b2 * (x1 - b1)) + 1))"
yvar <- "(1/(exp(-b2 * (x1 - b1)) + 1)) * (1 - (1/(exp(-b2 * (x1 - b1)) + 1)))"
res <- cfisher(ymean, yvar, ndpoints = 2, prec = 54)

# res$fim is Fisher information matrix for a two-points design 
res$fim(x = c(x11 = 2, x21 = 3), w = c(w1 = .5, w2 = .5), b = c(b1 = .9, b2 = .8))

# res$fim is Fisher information matrix for a two-points design with 54 precision
res$fim.mpfr(x = c(x11 = 2, x21 = 3), w = c(w1 = .5, w2 = .5), b = c(b1 = .9, b2 = .8))

# Fisher information matrix for model:
fim<- cfisher(ymean, yvar, ndpoints = 1, prec = 54)
res$fim(x = c(x11 = 2), w = c(w1 = 1), b = c(b1 = .9, b2 = .8))

## posison with E(y) = exp(b1 + b2 * x1 + b3 * x1^2 + b4 * x2 +b5 * x2^2 + b6 * x1 * x2)
ymean <- yvar <- "exp(b1 + b2 * x1 + b3 * x1^2 + b4 * x2 +b5 * x2^2 + b6 * x1 * x2)"
fim <- cfisher(ymean, yvar, ndpoints = 6, prec = 54)

# res$fim is Fisher information matrix for a six-points design 
res$fim(x = c(1:12), w = rep(1/6, 6), b = c(1:6)) ## NAN

# res$fim.mpfr is Fisher information matrix for a six-points design with 53 precision
res$fim.mpfr(x = c(1:12), w = rep(1/6, 6), b = c(1:6))

## Linear regression with two indeoendent varibales (the design points are two-dimensional)
ymean <- "b1 + b2 * x1 + b3 * x2"
yvar = "1"
res <- cfisher(ymean, yvar, ndpoints = 3, prec = 54)
res$fim(x = c(1:6), w = c(.3, .3, .3))
res$fim.mpfr(x = c(1:6), w = c(.3, .3, .3))

## Logistic model:
ymean <- "1/(exp(-b1 - b2 * x1) + 1)"
yvar <- "(1/(exp(-b1 - b2 * x1) + 1)) * (1 - (1/(exp(-b1 - b2 * x1) + 1)))"
cfisher(ymean, yvar, ndpoints = 2, prec = 54)

## Poisson model:
ymean <- yvar <-  "exp(b1 + b2 * x1)"
cfisher(ymean, yvar, ndpoints = 2, prec = 54)

## Poisson dose response model:
ymean <- yvar <- "b1 * exp(-b2 * x1)"
cfisher(ymean, yvar, ndpoints = 2, prec = 54)

## Inverse Quadratic model:
ymean <- "(b1 * x1)/(b2 + x1 + b3 * (x1)^2)"
yvar <- "1"
cfisher(ymean, yvar, ndpoints = 3, prec = 54)
#
ymean <- "x1/(b1 + b2 * x1 + b3 * (x1)^2)"
yvar <- "1"
cfisher(ymean, yvar, ndpoints = 3, prec = 54)

## Weibull model:
ymean <- "b1 - b2 * exp(-b3 * x1^b4)"
yvar <- "1"
cfisher(ymean, yvar, ndpoints = 4, prec = 54)

## Richards model:
ymean <- "b1/(1 + b2 * exp(-b3 * x1))^b4"
yvar <- "1"
cfisher(ymean, yvar, ndpoints = 4, prec = 54)

## Michaelis-Menten model:
ymean <- "(b1 * x1)/(1 + b2 * x1)"
yvar <- "1"
cfisher(ymean, yvar, ndpoints = 2, prec = 54)
#
ymean <- "(b1 * x1)/(b2 + x1)"
yvar <- "1"
cfisher(ymean, yvar, ndpoints = 2, prec = 54)
#
ymean <- "x1/(b1 + b2 * x1)"
yvar <- "1"
cfisher(ymean, yvar, ndpoints = 2, prec = 54)

## log-linear model
ymean <- "b1 + b2 * log(x1 + b3)"
yvar <- "1"
cfisher(ymean, yvar, ndpoints = 3, prec = 54)

## Exponential model:
ymean <- "b1 + b2 * exp(x1/b3)"
yvar <- "1"
cfisher(ymean, yvar, ndpoints = 3, prec = 54)

## Emax model:
ymean  <- "b1 + (b2 * x1)/(x1 + b3)"
yvar <- "1"
cfisher(ymean, yvar, ndpoints = 3, prec = 54)

## Negative binomial model Y ~ NB(E(Y), theta) where E(Y) = b1*exp(-b2*x1):
theta = 5
ymean <- "b1 * exp(-b2 * x1)"
yvar <- paste("b1 * exp(-b2 * x1) * (1 + (1/", theta, ") * b1 * exp(-b2 * x1))", sep = "")
cfisher(ymean, yvar, ndpoints = 3, prec = 54)



