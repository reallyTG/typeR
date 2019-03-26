library(VGAM)


### Name: gumbelUC
### Title: The Gumbel Distribution
### Aliases: dgumbel pgumbel qgumbel rgumbel
### Keywords: distribution

### ** Examples

mu <- 1; sigma <- 2;
y <- rgumbel(n = 100, loc = mu, scale = sigma)
c(mean(y), mu - sigma * digamma(1))  # Sample and population means
c(var(y), sigma^2 * pi^2 / 6)  # Sample and population variances

## Not run: 
##D  x <- seq(-2.5, 3.5, by = 0.01)
##D loc <- 0; sigma <- 1
##D plot(x, dgumbel(x, loc, sigma), type = "l", col = "blue", ylim = c(0, 1),
##D      main = "Blue is density, red is cumulative distribution function",
##D      sub = "Purple are 5,10,...,95 percentiles", ylab = "", las = 1)
##D abline(h = 0, col = "blue", lty = 2)
##D lines(qgumbel(seq(0.05, 0.95, by = 0.05), loc, sigma),
##D       dgumbel(qgumbel(seq(0.05, 0.95, by = 0.05), loc, sigma), loc, sigma),
##D       col = "purple", lty = 3, type = "h")
##D lines(x, pgumbel(x, loc, sigma), type = "l", col = "red")
##D abline(h = 0, lty = 2) 
## End(Not run)



