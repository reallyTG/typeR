library(msir)


### Name: plot.msir
### Title: Plot method for "msir" objects.
### Aliases: plot.msir
### Keywords: regression dplot

### ** Examples

## Not run: 
##D # 2-dimensional response curve
##D n <- 300
##D p <- 5
##D b1 <- c(1, 1, 1, rep(0, p-3))
##D b2 <- c(1,-1,-1, rep(0, p-3))
##D b <- cbind(b1,b2)
##D x <- matrix(rnorm(n*p), nrow = n, ncol = p)
##D y <- x %*% b1 + (x %*% b1)^3 + 4*(x %*% b2)^2 + rnorm(n)
##D MSIR <- msir(x, y)
##D summary(MSIR)
##D plot(MSIR)
##D plot(MSIR, which = 1:2)
##D plot(MSIR, type = "2Dplot", which = 1, span = 0.7)
##D plot(MSIR, type = "2Dplot", which = 2, span = 0.7)
##D plot(MSIR, type = "spinplot")
##D plot(MSIR, type = "evalues")
##D plot(MSIR, type = "coefficients")
## End(Not run)



