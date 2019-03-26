library(ivmte)


### Name: removeSplines
### Title: Separating splines from MTR formulas
### Aliases: removeSplines

### ** Examples

## Declare and MTR with a sline component.
m0 = ~ x1 + x1 : uSplines(degree = 2,
                          knots = c(0.2, 0.4)) +
            x2 : uSplines(degree = 2,
                          knots = c(0.2, 0.4)) +
            x1 : x2 : uSplines(degree = 2,
                               knots = c(0.2, 0.4)) +
            uSplines(degree = 3,
                     knots = c(0.2, 0.4),
                     intercept = FALSE)

## Now separate the spline component from the non-spline component
removeSplines(m0)




