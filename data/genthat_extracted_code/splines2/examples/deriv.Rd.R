library(splines2)


### Name: deriv
### Title: Derivative of Splines
### Aliases: deriv deriv.bSpline2 deriv.dbs deriv.ibs deriv.mSpline
###   deriv.iSpline deriv.cSpline

### ** Examples

library(splines2)
x <- c(seq.int(0, 1, 0.1), NA)  # NA's will be kept.
knots <- c(0.3, 0.5, 0.6)

## integal of B-splines and the corresponding B-splines integrated
ibsMat <- ibs(x, knots = knots)
bsMat <- bSpline(x, knots = knots)

## the first derivative
d1Mat <- deriv(ibsMat)
stopifnot(all.equal(bsMat, d1Mat, check.attributes = FALSE))

## the second derivative
d2Mat1 <- deriv(bsMat)
d2Mat2 <- deriv(ibsMat, derivs = 2L)
## nested calls are supported but not recommended
d2Mat3 <- deriv(deriv(ibsMat))
stopifnot(all.equal(d2Mat1, d2Mat2, d2Mat3, check.attributes = FALSE))

## C-splines, I-splines, M-splines and the derivatives
csMat <- cSpline(x, knots = knots, scale = FALSE)
isMat <- iSpline(x, knots = knots)
stopifnot(all.equal(isMat, deriv(csMat), check.attributes = FALSE))

msMat <- mSpline(x, knots = knots)
stopifnot(all.equal(msMat, deriv(isMat), deriv(csMat, 2),
                    deriv(deriv(csMat)), check.attributes = FALSE))

dmsMat <- mSpline(x, knots = knots, derivs = 1)
stopifnot(all.equal(dmsMat, deriv(msMat), deriv(isMat, 2),
                    deriv(deriv(isMat)), deriv(csMat, 3),
                    deriv(deriv(deriv(csMat))), check.attributes = FALSE))



