library(VGAM)


### Name: Frechet
### Title: The Frechet Distribution
### Aliases: Frechet dfrechet pfrechet qfrechet rfrechet
### Keywords: distribution

### ** Examples

## Not run: 
##D  shape <- 5
##D x <- seq(-0.1, 3.5, length = 401)
##D plot(x, dfrechet(x, shape = shape), type = "l", ylab = "", las = 1,
##D      main = "Frechet density divided into 10 equal areas; orange = cdf")
##D abline(h = 0, col = "blue", lty = 2)
##D qq <- qfrechet(seq(0.1, 0.9, by = 0.1), shape = shape)
##D lines(qq, dfrechet(qq, shape = shape), col = "purple", lty = 3, type = "h")
##D lines(x, pfrechet(q = x, shape = shape), col = "orange")
## End(Not run)



