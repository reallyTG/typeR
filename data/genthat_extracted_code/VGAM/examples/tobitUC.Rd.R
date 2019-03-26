library(VGAM)


### Name: Tobit
### Title: The Tobit Distribution
### Aliases: Tobit dtobit ptobit qtobit rtobit
### Keywords: distribution

### ** Examples

mu <- 0.5; x <- seq(-2, 4, by = 0.01)
Lower <- -1; Upper <- 2.0

integrate(dtobit, lower = Lower, upper = Upper,
          mean = mu, Lower = Lower, Upper = Upper)$value +
dtobit(Lower, mean = mu, Lower = Lower, Upper = Upper) +
dtobit(Upper, mean = mu, Lower = Lower, Upper = Upper)  # Adds to unity

## Not run: 
##D plot(x, ptobit(x, m = mu, Lower = Lower, Upper = Upper),
##D      type = "l", ylim = 0:1, las = 1, col = "orange",
##D      ylab = paste("ptobit(m = ", mu, ", sd = 1, Lower =", Lower,
##D                   ", Upper =", Upper, ")"),
##D      main = "Orange is cumulative distribution function; blue is density",
##D      sub = "Purple lines are the 10,20,...,90 percentiles")
##D abline(h = 0)
##D lines(x, dtobit(x, m = mu, Lower = Lower, Upper = Upper), col = "blue")
##D 
##D probs <- seq(0.1, 0.9, by = 0.1)
##D Q <- qtobit(probs, m = mu, Lower = Lower, Upper = Upper)
##D lines(Q, ptobit(Q, m = mu, Lower = Lower, Upper = Upper),
##D       col = "purple", lty = "dashed", type = "h")
##D lines(Q, dtobit(Q, m = mu, Lower = Lower, Upper = Upper),
##D       col = "darkgreen", lty = "dashed", type = "h")
##D abline(h = probs, col = "purple", lty = "dashed")
##D max(abs(ptobit(Q, m = mu, Lower = Lower, Upper = Upper) - probs))  # Should be 0
##D 
##D endpts <- c(Lower, Upper)  # Endpoints have a spike (not quite, actually)
##D lines(endpts, dtobit(endpts, m = mu, Lower = Lower, Upper = Upper),
##D       col = "blue", lwd = 3, type = "h")
## End(Not run)



