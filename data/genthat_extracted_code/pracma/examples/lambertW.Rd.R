library(pracma)


### Name: lambertWp
### Title: Lambert's W Function
### Aliases: lambertWp lambertWn
### Keywords: specfun

### ** Examples

##  Examples
lambertWp(0)          #=> 0
lambertWp(1)          #=> 0.5671432904097838...  Omega constant
lambertWp(exp(1))     #=> 1
lambertWp(-log(2)/2)  #=> -log(2)

# The solution of  x * a^x = z  is  W(log(a)*z)/log(a)
# x * 123^(x-1) = 3
lambertWp(3*123*log(123))/log(123)  #=> 1.19183018...

x <- seq(-0.35, 0.0, by=0.05)
w <- lambertWn(x)
w * exp(w)            # max. error < 3e-16
# [1] -0.35 -0.30 -0.25 -0.20 -0.15 -0.10 -0.05   NaN

## Not run: 
##D xs <- c(-1/exp(1), seq(-0.35, 6, by=0.05))
##D ys <- lambertWp(xs)
##D plot(xs, ys, type="l", col="darkred", lwd=2, ylim=c(-2,2),
##D      main="Lambert W0 Function", xlab="", ylab="")
##D grid()
##D points(c(-1/exp(1), 0, 1, exp(1)), c(-1, 0, lambertWp(1), 1))
##D text(1.8, 0.5, "Omega constant")
##D   
## End(Not run)

## Analytic derivative of lambertWp (similar for lambertWn)
D_lambertWp <- function(x) {
    xw <- lambertWp(x)
    1 / (1+xw) / exp(xw)
}
D_lambertWp(c(-1/exp(1), 0, 1, exp(1)))
# [1] Inf 1.0000000 0.3618963 0.1839397

## Second branch resp. the complex function lambertWm()
F <- function(xy, z0) {
    z <- xy[1] + xy[2]*1i
    fz <- z * exp(z) - z0
    return(c(Re(fz), Im(fz)))
}
newtonsys(F, c(-1, -1), z0 = -0.1)   #=> -3.5771520639573
newtonsys(F, c(-1, -1), z0 = -pi/2)  #=> -1.5707963267949i = -pi/2 * 1i



