library(SEL)


### Name: knotave
### Title: Calculate the knot averages of a B-spline basis.
### Aliases: knotave

### ** Examples

## Example for calculation of a control polygon
knts <- c(rep(0, 4), rep(1, 4))
cf <- c(-1, -1, 1/2, 0)
sq <- seq(0, 1, length = 101)
N <- splineDesign(sq, knots = knts, ord = 4)
res <- colSums(t(N)*cf)
plot(sq, res, type = "l", ylim = c(-1, 0.6))
kntAv <- knotave(knts, 3)
lines(kntAv, cf, col = "red") # add control polygon



