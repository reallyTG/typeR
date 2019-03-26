library(VGAM)


### Name: Card
### Title: Cardioid Distribution
### Aliases: Card dcard pcard qcard rcard
### Keywords: distribution

### ** Examples

## Not run: 
##D mu <- 4; rho <- 0.4; x <- seq(0, 2*pi, len = 501)
##D plot(x, dcard(x, mu, rho), type = "l", las = 1, ylim = c(0, 1), col = "blue",
##D      ylab = paste("[dp]card(mu=", mu, ", rho=", rho, ")"),
##D      main = "Blue is density, orange is cumulative distribution function",
##D      sub = "Purple lines are the 10,20,...,90 percentiles")
##D lines(x, pcard(x, mu, rho), col = "orange")
##D 
##D probs <- seq(0.1, 0.9, by = 0.1)
##D Q <- qcard(probs, mu, rho)
##D lines(Q, dcard(Q, mu, rho), col = "purple", lty = 3, type = "h")
##D lines(Q, pcard(Q, mu, rho), col = "purple", lty = 3, type = "h")
##D abline(h = c(0,probs, 1), v = c(0, 2*pi), col = "purple", lty = 3)
##D max(abs(pcard(Q, mu, rho) - probs))  # Should be 0
## End(Not run)



