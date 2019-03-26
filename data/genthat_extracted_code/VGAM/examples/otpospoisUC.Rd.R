library(VGAM)


### Name: Otpospois
### Title: One-truncated Positive-Poisson Distribution
### Aliases: Otpospois dotpospois potpospois qotpospois rotpospois
### Keywords: distribution

### ** Examples

dotpospois(1:20, 0.5)
rotpospois(20, 0.5)

## Not run: 
##D  lambda <- 4; x <- 1:10
##D plot(x, dotpospois(x, lambda = lambda), type = "h", ylim = 0:1,
##D      sub = "lambda=4", las = 1, col = "blue", ylab = "Probability",
##D      main = "1-truncated positive-Poisson distribution: blue=PMF; orange=CDF")
##D lines(x + 0.1, potpospois(x, lambda = lambda), col = "orange", lty = 3, type = "h") 
## End(Not run)



