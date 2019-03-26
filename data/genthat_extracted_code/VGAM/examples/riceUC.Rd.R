library(VGAM)


### Name: Rice
### Title: The Rice Distribution
### Aliases: Rice drice price qrice rrice
### Keywords: distribution

### ** Examples

## Not run: 
##D  x <- seq(0.01, 7, len = 201)
##D plot(x, drice(x, vee = 0, sigma = 1), type = "n", las = 1,, ylab = "",
##D      main = "Density of Rice distribution for various values of v")
##D sigma <- 1; vee <- c(0, 0.5, 1, 2, 4)
##D for (ii in 1:length(vee))
##D   lines(x, drice(x, vee = vee[ii], sigma), col = ii)
##D legend(x = 5, y = 0.6, legend = as.character(vee),
##D        col = 1:length(vee), lty = 1)
##D 
##D x <- seq(0, 4, by = 0.01); vee <- 1; sigma <- 1
##D probs <- seq(0.05, 0.95, by = 0.05)
##D plot(x, drice(x, vee = vee, sigma = sigma), type = "l", col = "blue",
##D      main = "Blue is density, orange is cumulative distribution function",
##D      ylim = c(0, 1), sub = "Purple are 5, 10, ..., 95 percentiles",
##D      las = 1, ylab = "", cex.main = 0.9)
##D abline(h = 0:1, col = "black", lty = 2)
##D Q <- qrice(probs, sigma, vee = vee)
##D lines(Q, drice(qrice(probs, sigma, vee = vee),
##D                sigma, vee = vee), col = "purple", lty = 3, type = "h")
##D lines(x, price(x, sigma, vee = vee), type = "l", col = "orange")
##D lines(Q, drice(Q, sigma, vee = vee), col = "purple", lty = 3, type = "h")
##D lines(Q, price(Q, sigma, vee = vee), col = "purple", lty = 3, type = "h")
##D abline(h = probs, col = "purple", lty = 3)
##D max(abs(price(Q, sigma, vee = vee) - probs))  # Should be 0
## End(Not run)



