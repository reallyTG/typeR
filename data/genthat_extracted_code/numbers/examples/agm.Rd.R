library(numbers)


### Name: agm
### Title: Arithmetic-geometric Mean
### Aliases: agm

### ** Examples

##  Gauss constant
1 / agm(1, sqrt(2))  # 0.834626841674073

##  Calculate the (elliptic) integral 2/pi \int_0^1 dt / sqrt(1 - t^4)
f <- function(t) 1 / sqrt(1-t^4)
2 / pi * integrate(f, 0, 1)$value
1 / agm(1, sqrt(2))

##  Calculate pi with quadratic convergence (modified AGM)
#   See algorithm 2.1 in Borwein and Borwein
y <- sqrt(sqrt(2))
x <- (y+1/y)/2
p <- 2+sqrt(2)
for (i in 1:6){
  cat(format(p, digits=16), "\n")
  p <- p * (1+x) / (1+y)
  s <- sqrt(x)
  y <- (y*s + 1/s) / (1+y)
  x <- (s+1/s)/2
  }

## Not run: 
##D ##  Calculate pi with arbitrary precision using the Rmpfr package
##D require("Rmpfr")
##D vpa <- function(., d = 32) mpfr(., precBits = 4*d)
##D # Function to compute \pi to d decimal digits accuracy, based on the 
##D # algebraic-geometric mean, correct digits are doubled in each step.
##D agm_pi <- function(d) {
##D     a <- vpa(1, d)
##D     b <- 1/sqrt(vpa(2, d))
##D     s <- 1/vpa(4, d)
##D     p <- 1
##D     n <- ceiling(log2(d));
##D     for (k in 1:n) {
##D         c <- (a+b)/2
##D         b <- sqrt(a*b)
##D         s <- s - p * (c-a)^2
##D         p <- 2 * p
##D         a <- c
##D     }
##D     return(a^2/s)
##D }
##D d <- 64
##D pia <- agm_pi(d)
##D print(pia, digits = d)
##D # 3.141592653589793238462643383279502884197169399375105820974944592
##D # 3.1415926535897932384626433832795028841971693993751058209749445923 exact
## End(Not run)



