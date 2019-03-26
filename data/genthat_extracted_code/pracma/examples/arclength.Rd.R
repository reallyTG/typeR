library(pracma)


### Name: arclength
### Title: Arc Length of a Curve
### Aliases: arclength
### Keywords: math

### ** Examples

##  Example: parametrized 3D-curve with t in 0..3*pi
f <- function(t) c(sin(2*t), cos(t), t)
arclength(f, 0, 3*pi)
# $length:  17.22203            # true length 17.222032...

##  Example: length of the sine curve
f <- function(t) c(t, sin(t))
arclength(f, 0, pi)             # true length  3.82019...

## Example: Length of an ellipse with axes a = 1 and b = 0.5
# parametrization x = a*cos(t), y = b*sin(t)
a <- 1.0; b <- 0.5
f <- function(t) c(a*cos(t), b*sin(t))
L <- arclength(f, 0, 2*pi, tol = 1e-10)     #=> 4.84422411027
# compare with elliptic integral of the second kind
e <- sqrt(1 - b^2/a^2)                      # ellipticity
L <- 4 * a * ellipke(e^2)$e                 #=> 4.84422411027

## Not run: 
##D ##  Example: oscillating 1-dimensional function (from 0 to 5)
##D f <- function(x) x * cos(0.1*exp(x)) * sin(0.1*pi*exp(x))
##D F <- function(t) c(t, f(t))
##D L <- arclength(F, 0, 5, tol = 1e-12, nmax = 25)
##D print(L$length, digits = 16)
##D # [1] 82.81020372882217         # true length 82.810203728822172...
##D 
##D # Split this computation in 10 steps (run time drops from 2 to 0.2 secs)
##D L <- 0
##D for (i in 1:10)
##D 	L <- L + arclength(F, (i-1)*0.5, i*0.5, tol = 1e-10)$length
##D print(L, digits = 16)
##D # [1] 82.81020372882216
##D 
##D # Alternative calculation of arc length
##D f1 <- function(x) sqrt(1 + complexstep(f, x)^2)
##D L1 <- quadgk(f1, 0, 5, tol = 1e-14)
##D print(L1, digits = 16)
##D # [1] 82.81020372882216
##D   
## End(Not run)

## Not run: 
##D #-- --------------------------------------------------------------------
##D #   Arc-length parametrization of Fermat's spiral
##D #-- --------------------------------------------------------------------
##D # Fermat's spiral: r = a * sqrt(t) 
##D f <- function(t) 0.25 * sqrt(t) * c(cos(t), sin(t))
##D 
##D t1 <- 0; t2 <- 6*pi
##D a  <- 0; b  <- arclength(f, t1, t2)$length
##D fParam <- function(w) {
##D     fct <- function(u) arclength(f, a, u)$length - w
##D     urt <- uniroot(fct, c(a, 6*pi))
##D     urt$root
##D }
##D 
##D ts <- linspace(0, 6*pi, 250)
##D plot(matrix(f(ts), ncol=2), type='l', col="blue", 
##D      asp=1, xlab="", ylab = "",
##D      main = "Fermat's Spiral", sub="20 subparts of equal length")
##D 
##D for (i in seq(0.05, 0.95, by=0.05)) {
##D     v <- fParam(i*b); fv <- f(v)
##D     points(fv[1], f(v)[2], col="darkred", pch=20)
##D } 
## End(Not run)



