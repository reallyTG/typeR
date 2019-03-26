library(pracma)


### Name: ppval
### Title: Piecewise Polynomial Structures
### Aliases: mkpp ppval
### Keywords: fitting

### ** Examples

##  Example: Linear interpolation of the sine function
xs <- linspace(0, pi, 10)
ys <- sin(xs)
P <- matrix(NA, nrow = 9, ncol = 2)
for (i in 1:9) {
    P[i, ] <- c((ys[i+1]-ys[i])/(xs[i+1]-xs[i]), ys[i])
}
ppsin <- mkpp(xs, P)

## Not run: 
##D plot(xs, ys); grid()
##D x100 <- linspace(0, pi, 100)
##D lines(x100, sin(x100), col="darkgray")
##D ypp <- ppval(ppsin, x100)
##D lines(x100, ypp, col="red")
## End(Not run)



