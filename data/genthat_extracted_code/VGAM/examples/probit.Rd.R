library(VGAM)


### Name: probit
### Title: Probit Link Function
### Aliases: probit
### Keywords: math models regression

### ** Examples

p <- seq(0.01, 0.99, by = 0.01)
probit(p)
max(abs(probit(probit(p), inverse = TRUE) - p))  # Should be 0

p <- c(seq(-0.02, 0.02, by = 0.01), seq(0.97, 1.02, by = 0.01))
probit(p)  # Has NAs
probit(p, bvalue = .Machine$double.eps)  # Has no NAs

## Not run: 
##D p <- seq(0.01, 0.99, by = 0.01); par(lwd = (mylwd <- 2))
##D plot(p, logit(p), type = "l", col = "limegreen", ylab = "transformation",
##D      las = 1, main = "Some probability link functions")
##D lines(p,  probit(p), col = "purple")
##D lines(p, cloglog(p), col = "chocolate")
##D lines(p, cauchit(p), col = "tan")
##D abline(v = 0.5, h = 0, lty = "dashed")
##D legend(0.1, 4.0, c("logit", "probit", "cloglog", "cauchit"),
##D        col = c("limegreen", "purple", "chocolate", "tan"), lwd = mylwd)
##D par(lwd = 1) 
## End(Not run)



