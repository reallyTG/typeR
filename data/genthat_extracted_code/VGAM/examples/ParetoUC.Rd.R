library(VGAM)


### Name: Pareto
### Title: The Pareto Distribution
### Aliases: Pareto dpareto ppareto qpareto rpareto
### Keywords: distribution

### ** Examples

alpha <- 3; k <- exp(1); x <- seq(2.8, 8, len = 300)
## Not run: 
##D plot(x, dpareto(x, scale = alpha, shape = k), type = "l",
##D      main = "Pareto density split into 10 equal areas")
##D abline(h = 0, col = "blue", lty = 2)
##D qvec <- qpareto(seq(0.1, 0.9, by = 0.1), scale = alpha, shape = k)
##D lines(qvec, dpareto(qvec, scale = alpha, shape = k),
##D       col = "purple", lty = 3, type = "h")
## End(Not run)
pvec <- seq(0.1, 0.9, by = 0.1)
qvec <- qpareto(pvec, scale = alpha, shape = k)
ppareto(qvec, scale = alpha, shape = k)
qpareto(ppareto(qvec, scale = alpha, shape = k),
        scale = alpha, shape = k) - qvec  # Should be 0



