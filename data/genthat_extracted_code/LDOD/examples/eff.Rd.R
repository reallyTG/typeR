library(LDOD)


### Name: eff
### Title: Calculation of D-efficiency with arbitrary precision
### Aliases: eff
### Keywords: optimal design Fisher information matrix D-efficiency

### ** Examples

## Logistic dose-response model
ymean <- "(1/(exp(-b2*(x1-b1))+1))"
yvar <- "(1/(exp(-b2*(x1-b1))+1))*(1-(1/(exp(-b2*(x1-b1))+1)))"
eff (ymean, yvar,  param = c(.9, .8), points1 = c(-3, 1, 2), 
     points2 = c(-1.029256,  2.829256), weights1 = rep(.33, 3), weights2 = c(.5, .5),
     prec = 54)
## or
ldlogistic(a = .9 , b = .8, form = 2, lb = -5, ub = 5, user.points = c(-3, 1, 2),
           user.weights = c(.33, .33, .33))$user.eff


## Poisson model:
ymean <- yvar <-  "exp(b1 + b2 * x1)"
eff (ymean, yvar,  param = c(.9, .8), points1 = c(-3, 1, 2), points2 = c(2.5, 5.0),
     weights1 = rep(.33, 3), weights2 = c(.5, .5), prec = 54)

#####################################################################
## In the following, ymean and yvar for some famous models are given:

## Logistic model:
ymean <- "1/(exp(-b1 - b2 * x1) + 1)"
yvar <- "(1/(exp(-b1 - b2 * x1) + 1))*(1 - (1/(exp(-b1 - b2 * x1) + 1)))"

## Poisson dose response model:
ymean <- yvar <- "b1 * exp(-b2 * x1)"

## Inverse Quadratic model:
ymean <- "(b1 * x1)/(b2 + x1 + b3 * (x1)^2)"
yvar <- "1"
#
ymean <- "x1/(b1 + b2 * x1 + b3 * (x1)^2)"
yvar <- "1"

## Weibull model:
ymean <- "b1 - b2 * exp(-b3 * x1^b4)"
yvar <- "1"

## Richards model:
ymean <- "b1/(1 + b2 * exp(-b3 * x1))^b4"
yvar <- "1"

## Michaelis-Menten model:
ymean <- "(b1 * x1)/(1 + b2 * x1)"
yvar <- "1"
#
ymean <- "(b1 * x1)/(b2 + x1)"
yvar <- "1"
#
ymean <- "x1/(b1 + b2 * x1)"
yvar <- "1"

## log-linear model:
ymean <- "b1 + b2 * log(x1 + b3)"
yvar <- "1"

## Exponential model:
ymean <- "b1 + b2 * exp(x1/b3)"
yvar <- "1"

## Emax model:
ymean  <- "b1 + (b2 * x1)/(x1 + b3)"
yvar <- "1"

## Negative binomial model Y ~ NB(E(Y), theta) where E(Y) = b1 * exp(-b2 * x1):
theta <- 5
ymean <- "b1 * exp(-b2 * x1)"
yvar <- paste ("b1 * exp(-b2 * x1)*(1 + (1/", theta, ") * b1 * exp(-b2 * x1))", sep = "")

## Linear regression model:
ymean <- "b1 + b2 * x1 + b3 * x2 + b4 * x1 * x2"
yvar = "1"



