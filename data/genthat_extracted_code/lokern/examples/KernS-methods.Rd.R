library(lokern)


### Name: KernS-methods
### Title: Methods for ("KernS" classed) Results of lokerns() and glkerns()
### Aliases: fitted.KernS lines.KernS plot.KernS predict.KernS print.KernS
###   residuals.KernS
### Keywords: utilities

### ** Examples

## "interesting" artificial data:
set.seed(47)
x <- sort(round(10*runif(250),2))
fx <- 5 - x/2 + 3*exp(-(x-5)^2)
y <- fx + rnorm(fx)/4
plot(x,y)
lof <- lokerns(x,y, trace=1)# tracing the phases inside the Fortran code
plot(lof)
plot(lof, cex = 1/4)# maybe preferable
## Simpler, using the lines() method:
plot(x,y); lines(lof, lwd=2, col=2)

qqnorm(residuals(lof)) # hmm... overfitting?
stopifnot(all.equal(y, fitted(lof) + residuals(lof), tolerance = 1e-15),
          predict(lof)$y == fitted(lof))
lof$iter # negative ?
tt <- seq(0, 10, by=1/32)
p0 <- predict(lof, x=tt)
p1 <- predict(lof, x=tt, deriv=1)
p2 <- predict(lof, x=tt, deriv=2)
plot(p2, type="l"); abline(h=0, lty=3) # not satisfactory:
lof2 <- lokerns(x,y, deriv=2)
plot(lof2, main=
   "lokerns(*, deriv=2) -- much more smooth than predict(*,deriv=2)")
lines(p2); abline(h=0, lty=3)



