library(VGAM)


### Name: cauchit
### Title: Cauchit Link Function
### Aliases: cauchit
### Keywords: math models regression

### ** Examples

p <- seq(0.01, 0.99, by=0.01)
cauchit(p)
max(abs(cauchit(cauchit(p), inverse = TRUE) - p))  # Should be 0

p <- c(seq(-0.02, 0.02, by=0.01), seq(0.97, 1.02, by = 0.01))
cauchit(p)  # Has no NAs

## Not run: 
##D par(mfrow = c(2, 2), lwd = (mylwd <- 2))
##D y <- seq(-4, 4, length = 100)
##D p <- seq(0.01, 0.99, by = 0.01)
##D 
##D for (d in 0:1) {
##D   matplot(p, cbind(logit(p, deriv = d), probit(p, deriv = d)),
##D           type = "n", col = "purple", ylab = "transformation",
##D           las = 1, main = if (d == 0) "Some probability link functions"
##D           else "First derivative")
##D   lines(p,   logit(p, deriv = d), col = "limegreen")
##D   lines(p,  probit(p, deriv = d), col = "purple")
##D   lines(p, cloglog(p, deriv = d), col = "chocolate")
##D   lines(p, cauchit(p, deriv = d), col = "tan")
##D   if (d == 0) {
##D     abline(v = 0.5, h = 0, lty = "dashed")
##D     legend(0, 4.5, c("logit", "probit", "cloglog", "cauchit"), lwd = mylwd,
##D            col = c("limegreen","purple","chocolate", "tan"))
##D   } else
##D     abline(v = 0.5, lty = "dashed")
##D }
##D 
##D for (d in 0) {
##D   matplot(y, cbind( logit(y, deriv = d, inverse = TRUE),
##D                    probit(y, deriv = d, inverse = TRUE)),
##D           type  = "n", col = "purple", xlab = "transformation", ylab = "p",
##D           main = if (d == 0) "Some inverse probability link functions"
##D           else "First derivative", las=1)
##D   lines(y,   logit(y, deriv = d, inverse = TRUE), col = "limegreen")
##D   lines(y,  probit(y, deriv = d, inverse = TRUE), col = "purple")
##D   lines(y, cloglog(y, deriv = d, inverse = TRUE), col = "chocolate")
##D   lines(y, cauchit(y, deriv = d, inverse = TRUE), col = "tan")
##D   if (d == 0) {
##D       abline(h = 0.5, v = 0, lty = "dashed")
##D       legend(-4, 1, c("logit", "probit", "cloglog", "cauchit"), lwd = mylwd,
##D              col = c("limegreen", "purple", "chocolate", "tan"))
##D   }
##D }
##D par(lwd = 1)
## End(Not run)



