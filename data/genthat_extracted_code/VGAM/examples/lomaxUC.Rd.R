library(VGAM)


### Name: Lomax
### Title: The Lomax Distribution
### Aliases: Lomax dlomax plomax qlomax rlomax
### Keywords: distribution

### ** Examples

probs <- seq(0.1, 0.9, by = 0.1)
max(abs(plomax(qlomax(p = probs, shape3.q =  1),
               shape3.q = 1) - probs))  # Should be 0

## Not run: 
##D  par(mfrow = c(1, 2))
##D x <- seq(-0.01, 5, len = 401)
##D plot(x, dexp(x), type = "l", col = "black", ylab = "", ylim = c(0, 3),
##D      main = "Black is standard exponential, others are dlomax(x, shape3.q)")
##D lines(x, dlomax(x, shape3.q = 1), col = "orange")
##D lines(x, dlomax(x, shape3.q = 2), col = "blue")
##D lines(x, dlomax(x, shape3.q = 5), col = "green")
##D legend("topright", col = c("orange","blue","green"), lty = rep(1, 3),
##D        legend = paste("shape3.q =", c(1, 2, 5)))
##D 
##D plot(x, pexp(x), type = "l", col = "black", ylab = "", las = 1,
##D      main = "Black is standard exponential, others are plomax(x, shape3.q)")
##D lines(x, plomax(x, shape3.q = 1), col = "orange")
##D lines(x, plomax(x, shape3.q = 2), col = "blue")
##D lines(x, plomax(x, shape3.q = 5), col = "green")
##D legend("bottomright", col = c("orange","blue","green"), lty = rep(1, 3),
##D        legend = paste("shape3.q =", c(1, 2, 5)))
## End(Not run)



