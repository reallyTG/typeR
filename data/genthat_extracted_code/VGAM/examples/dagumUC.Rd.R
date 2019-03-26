library(VGAM)


### Name: Dagum
### Title: The Dagum Distribution
### Aliases: Dagum ddagum pdagum qdagum rdagum
### Keywords: distribution

### ** Examples

probs <- seq(0.1, 0.9, by = 0.1)
shape1.a <- 1; shape2.p <- 2
# Should be 0:
max(abs(pdagum(qdagum(p = probs, shape1.a = shape1.a, shape2.p =  shape2.p),
                                 shape1.a = shape1.a, shape2.p = shape2.p) - probs))

## Not run: 
##D  par(mfrow = c(1, 2))
##D x <- seq(-0.01, 5, len = 401)
##D plot(x, dexp(x), type = "l", col = "black", ylab = "", las = 1, ylim = c(0, 1),
##D      main = "Black is standard exponential, others are ddagum(x, ...)")
##D lines(x, ddagum(x, shape1.a = shape1.a, shape2.p = 1), col = "orange")
##D lines(x, ddagum(x, shape1.a = shape1.a, shape2.p = 2), col = "blue")
##D lines(x, ddagum(x, shape1.a = shape1.a, shape2.p = 5), col = "green")
##D legend("topright", col = c("orange","blue","green"), lty = rep(1, len = 3),
##D        legend = paste("shape1.a =", shape1.a, ", shape2.p =", c(1, 2, 5)))
##D 
##D plot(x, pexp(x), type = "l", col = "black", ylab = "", las = 1,
##D      main = "Black is standard exponential, others are pdagum(x, ...)")
##D lines(x, pdagum(x, shape1.a = shape1.a, shape2.p = 1), col = "orange")
##D lines(x, pdagum(x, shape1.a = shape1.a, shape2.p = 2), col = "blue")
##D lines(x, pdagum(x, shape1.a = shape1.a, shape2.p = 5), col = "green")
##D legend("bottomright", col = c("orange","blue","green"), lty = rep(1, len = 3),
##D        legend = paste("shape1.a =", shape1.a, ", shape2.p =", c(1, 2, 5)))
## End(Not run)



