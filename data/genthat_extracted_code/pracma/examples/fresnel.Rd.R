library(pracma)


### Name: fresnelS/C
### Title: Fresnel Integrals
### Aliases: fresnelS fresnelC
### Keywords: specfun

### ** Examples

##  Compute Fresnel integrals through Gauss-Legendre quadrature
f1 <- function(t) sin(0.5 * pi * t^2)
f2 <- function(t) cos(0.5 * pi * t^2)
for (x in seq(0.5, 2.5, by = 0.5)) {
    cgl <- gaussLegendre(51, 0, x)
    fs <- sum(cgl$w * f1(cgl$x))
    fc <- sum(cgl$w * f2(cgl$x))
    cat(formatC(c(x, fresnelS(x), fs, fresnelC(x), fc),
        digits = 8, width = 12, flag = " ----"), "\n")
}

## Not run: 
##D xs <- seq(0, 7.5, by = 0.025)
##D ys <- fresnelS(xs)
##D yc <- fresnelC(xs)
##D 
##D ##  Function plot of the Fresnel integrals
##D plot(xs, ys, type = "l", col = "darkgreen",
##D     xlim = c(0, 8), ylim = c(0, 1),
##D     xlab = "", ylab = "", main = "Fresnel Integrals")
##D lines(xs, yc, col = "blue")
##D legend(6.25, 0.95, c("S(x)", "C(x)"), col = c("darkgreen", "blue"), lty = 1)
##D grid()
##D 
##D ##  The Cornu (or Euler) spiral
##D plot(c(-1, 1), c(-1, 1), type = "n",
##D     xlab = "", ylab = "", main = "Cornu Spiral")
##D lines(ys, yc, col = "red")
##D lines(-ys, -yc, col = "red")
##D grid()
## End(Not run)



