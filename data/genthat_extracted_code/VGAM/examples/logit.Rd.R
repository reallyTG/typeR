library(VGAM)


### Name: logit
### Title: Logit Link Function
### Aliases: logit extlogit
### Keywords: math models regression

### ** Examples

p <- seq(0.01, 0.99, by = 0.01)
logit(p)
max(abs(logit(logit(p), inverse = TRUE) - p))  # Should be 0

p <- c(seq(-0.02, 0.02, by = 0.01), seq(0.97, 1.02, by = 0.01))
logit(p)  # Has NAs
logit(p, bvalue = .Machine$double.eps)  # Has no NAs

p <- seq(0.9, 2.2, by = 0.1)
extlogit(p, min = 1, max = 2,
          bminvalue = 1 + .Machine$double.eps,
          bmaxvalue = 2 - .Machine$double.eps)  # Has no NAs

## Not run: 
##D  par(mfrow = c(2,2), lwd = (mylwd <- 2))
##D y <- seq(-4, 4, length = 100)
##D p <- seq(0.01, 0.99, by = 0.01)
##D for (d in 0:1) {
##D   myinv <- (d > 0)
##D   matplot(p, cbind( logit(p, deriv = d, inverse = myinv),
##D                    probit(p, deriv = d, inverse = myinv)),
##D           type = "n", col = "purple", ylab = "transformation", las = 1,
##D           main = if (d ==  0) "Some probability link functions"
##D           else "1 / first derivative")
##D   lines(p,   logit(p, deriv = d, inverse = myinv), col = "limegreen")
##D   lines(p,  probit(p, deriv = d, inverse = myinv), col = "purple")
##D   lines(p, cloglog(p, deriv = d, inverse = myinv), col = "chocolate")
##D   lines(p, cauchit(p, deriv = d, inverse = myinv), col = "tan")
##D   if (d ==  0) {
##D     abline(v = 0.5, h = 0, lty = "dashed")
##D     legend(0, 4.5, c("logit", "probit", "cloglog", "cauchit"),
##D            col = c("limegreen", "purple", "chocolate", "tan"), lwd = mylwd)
##D   } else
##D     abline(v = 0.5, lty = "dashed")
##D }
##D 
##D for (d in 0) {
##D   matplot(y, cbind(logit(y, deriv = d, inverse = TRUE),
##D                    probit(y, deriv = d, inverse = TRUE)), las = 1,
##D           type = "n", col = "purple", xlab = "transformation", ylab = "p",
##D           main = if (d ==  0) "Some inverse probability link functions"
##D           else "First derivative")
##D   lines(y,   logit(y, deriv = d, inverse = TRUE), col = "limegreen")
##D   lines(y,  probit(y, deriv = d, inverse = TRUE), col = "purple")
##D   lines(y, cloglog(y, deriv = d, inverse = TRUE), col = "chocolate")
##D   lines(y, cauchit(y, deriv = d, inverse = TRUE), col = "tan")
##D   if (d ==  0) {
##D     abline(h = 0.5, v = 0, lty = "dashed")
##D     legend(-4, 1, c("logit", "probit", "cloglog", "cauchit"),
##D            col = c("limegreen", "purple", "chocolate", "tan"), lwd = mylwd)
##D   }
##D }
##D 
##D p <- seq(0.21, 0.59, by = 0.01)
##D plot(p, extlogit(p, min = 0.2, max = 0.6),
##D      type = "l", col = "black", ylab = "transformation", xlim = c(0, 1),
##D      las = 1, main = "extlogit(p, min = 0.2, max = 0.6)")
##D par(lwd = 1)
## End(Not run)



