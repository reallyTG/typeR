library(pracma)


### Name: chebPoly
### Title: Chebyshev Polynomials
### Aliases: chebPoly
### Keywords: math

### ** Examples

chebPoly(6)

## Not run: 
##D ##  Plot 6 Chebyshev Polynomials
##D plot(0, 0, type="n", xlim=c(-1, 1), ylim=c(-1.2, 1.2),
##D     main="Chebyshev Polynomials for n=1..6", xlab="x", ylab="y")
##D grid()
##D x <- seq(-1, 1, length.out = 101)
##D for (i in 1:6) {
##D     y <- chebPoly(i, x)
##D     lines(x, y, col=i)
##D }
##D legend(x = 0.55, y = 1.2, c("n=1", "n=2", "n=3", "n=4", "n=5", "n=6"),
##D     col = 1:6, lty = 1, bg="whitesmoke", cex = 0.75)
## End(Not run)



