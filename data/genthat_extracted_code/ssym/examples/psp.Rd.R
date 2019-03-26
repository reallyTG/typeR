library(ssym)


### Name: psp
### Title: Tool to build the basis matrix and the penalty matrix of
###   P-splines.
### Aliases: psp

### ** Examples

n <- 300
t <- sort(round(runif(n),digits=2))

t2 <- psp(t, diff=3)
N <- attr(t2, "N") ## B-spline basis matrix
M <- attr(t2, "K") ## Penalty Matrix
knots <- attr(t2,"knots") ## Set of knots



