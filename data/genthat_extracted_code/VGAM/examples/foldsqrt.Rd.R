library(VGAM)


### Name: foldsqrt
### Title: Folded Square Root Link Function
### Aliases: foldsqrt
### Keywords: math models regression

### ** Examples

p <- seq(0.01, 0.99, by = 0.01)
foldsqrt(p)
max(abs(foldsqrt(foldsqrt(p), inverse = TRUE) - p))  # Should be 0

p <- c(seq(-0.02, 0.02, by = 0.01), seq(0.97, 1.02, by = 0.01))
foldsqrt(p)  # Has NAs

## Not run: 
##D p <- seq(0.01, 0.99, by = 0.01)
##D par(mfrow = c(2, 2), lwd = (mylwd <- 2))
##D y <- seq(-4, 4, length = 100)
##D for (d in 0:1) {
##D   matplot(p, cbind(logit(p, deriv = d), foldsqrt(p, deriv = d)),
##D           type = "n", col = "purple", ylab = "transformation", las = 1,
##D           main = if (d == 0) "Some probability link functions"
##D           else "First derivative")
##D   lines(p, logit(p, deriv = d), col = "limegreen")
##D   lines(p, probit(p, deriv = d), col = "purple")
##D   lines(p, cloglog(p, deriv = d), col = "chocolate")
##D   lines(p, foldsqrt(p, deriv = d), col = "tan")
##D   if (d == 0) {
##D     abline(v = 0.5, h = 0, lty = "dashed")
##D     legend(0, 4.5, c("logit", "probit", "cloglog", "foldsqrt"), lwd = 2,
##D            col = c("limegreen","purple","chocolate", "tan"))
##D   } else
##D     abline(v = 0.5, lty = "dashed")
##D }
##D 
##D for (d in 0) {
##D   matplot(y, cbind(logit(y, deriv = d, inverse = TRUE),
##D                    foldsqrt(y, deriv = d, inverse = TRUE)),
##D           type = "n", col = "purple", xlab = "transformation", ylab = "p",
##D           lwd = 2, las = 1,
##D           main = if (d == 0) "Some inverse probability link functions"
##D           else "First derivative")
##D   lines(y, logit(y, deriv = d, inverse = TRUE), col = "limegreen")
##D   lines(y, probit(y, deriv = d, inverse = TRUE), col = "purple")
##D   lines(y, cloglog(y, deriv = d, inverse = TRUE), col = "chocolate")
##D   lines(y, foldsqrt(y, deriv = d, inverse = TRUE), col = "tan")
##D   if (d == 0) {
##D     abline(h = 0.5, v = 0, lty = "dashed")
##D     legend(-4, 1, c("logit", "probit", "cloglog", "foldsqrt"), lwd = 2,
##D            col = c("limegreen","purple","chocolate", "tan"))
##D   }
##D }
##D par(lwd = 1)
## End(Not run)

# This is lucky to converge
fit.h <- vglm(agaaus ~ sm.bs(altitude), binomialff(link = foldsqrt(mux = 5)),
              data = hunua, trace = TRUE)
## Not run: 
##D plotvgam(fit.h, se = TRUE, lcol = "orange", scol = "orange",
##D          main = "Orange is Hunua, Blue is Waitakere") 
## End(Not run)
head(predict(fit.h, hunua, type = "response"))


## Not run: 
##D # The following fails.
##D pneumo <- transform(pneumo, let = log(exposure.time))
##D fit <- vglm(cbind(normal, mild, severe) ~ let,
##D             cumulative(link = foldsqrt(mux = 10), par = TRUE, rev = TRUE),
##D             data = pneumo, trace = TRUE, maxit = 200) 
## End(Not run)



