library(LDOD)


### Name: cfderiv
### Title: Auto-constructing Frechet derivative of D-criterion based on
###   general equivalence theorem
### Aliases: cfderiv
### Keywords: optimal design equivalence theorem

### ** Examples

## Logistic dose response model:
ymean <- "(1/(exp(-b2 * (x1 - b1)) + 1))"
yvar <- "(1/(exp(-b2 * (x1 - b1)) + 1))*(1 - (1/(exp(-b2 * (x1 - b1)) + 1)))"
func <- cfderiv(ymean, yvar, param =  c(.9, .8), points = c(-1.029256, 2.829256),
 weights = c(.5, .5))
## plot func on the design interval to verify the optimality of the given design
x <- seq(-5, 5, by = .1)
plot(x, -func(x), type = "l")

## Inverse Quadratic model
ymean <- "x1/(b1 + b2 * x1 + b3 * (x1)^2)"
yvar <- "1"
func <- cfderiv(ymean, yvar, param = c(17, 15, 9), points = c(0.33, 1.37, 5.62), 
weights = rep(.33, 3))
## plot func on the design interval to verify the optimality of the given design
x <- seq(0, 15, by = .1)
plot(x, -func(x), type = "l")

#####################################################################
## In the following, ymean and yvar for some famous models are given:

## Inverse Quadratic model (another form):
ymean <- "(b1 * x1)/(b2 + x1 + b3 * (x1)^2)"
yvar <- "1"

## Logistic dose response model:
ymean <- "(1/(exp(-b2 * (x1 - b1)) + 1))"
yvar <- "(1/(exp(-b2 * (x1 - b1)) + 1)) * (1 - (1/(exp(-b2 * (x1 - b1)) + 1)))"

## Logistic model:
ymean <- "1/(exp(-b1 - b2 * x1) + 1)"
yvar <- "(1/(exp(-b1 - b2 * x1) + 1)) * (1 - (1/(exp(-b1 - b2 * x1) + 1)))"

## Poisson model:
ymean <- yvar <-  "exp(b1 + b2 * x1)"

## Poisson dose response model:
ymean <- yvar <- "b1 * exp(-b2 * x1)"

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
yvar <= "1"
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

## Negative binomial model Y ~ NB(E(Y), theta) where E(Y) = b1*exp(-b2*x1):
theta = 5
ymean <- "b1 * exp(-b2 * x1)"
yvar <- paste ("b1 * exp(-b2 * x1) * (1 + (1/", theta, ") * b1 * exp(-b2 * x1))" , sep = "")

## Linear regression model:
ymean <- "b1 + b2 * x1 + b3 * x2 + b4 * x1 * x2"
yvar = "1"



