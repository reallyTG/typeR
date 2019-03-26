library(ivmte)


### Name: uSplinesBasis
### Title: Spline basis function
### Aliases: uSplinesBasis

### ** Examples

## Since the splines are declared as part of the MTR, you will need
## to have parsed out the spline command. Thus, this command will be
## called via eval(parse(text = .)). In the examples below, the
## commands are parsed from the object \code{splineslist} generated
## by \code{\link[MST]{removeSplines}}. The names of the elements in
## the list are the spline commands, and the elements themselves are
## the terms that interact with the splines.

## Declare MTR function
m0 = ~ x1 + x1 : uSplines(degree = 2,
                          knots = c(0.2, 0.4)) +
    x2 : uSplines(degree = 2,
                  knots = c(0.2, 0.4)) +
    x1 : x2 : uSplines(degree = 2,
                       knots = c(0.2, 0.4)) +
    uSplines(degree = 3,
             knots = c(0.2, 0.4),
             intercept = FALSE)

## Extract spline functions from MTR function
splineslist <- removeSplines(m0)$splineslist

## Declare points at which we wish to evaluate the spline functions
x <- seq(0, 1, 0.2)

## Evaluate the splines
eval(parse(text = gsub("uSplines\\(",
                       "ivmte:::uSplinesBasis(x = x, ",
                        names(splineslist)[1])))

eval(parse(text = gsub("uSplines\\(",
                       "ivmte:::uSplinesBasis(x = x, ",
                       names(splineslist)[2])))



