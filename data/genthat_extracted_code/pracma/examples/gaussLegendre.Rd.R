library(pracma)


### Name: gaussLegendre
### Title: Gauss-Legendre Quadrature Formula
### Aliases: gaussLegendre
### Keywords: math

### ** Examples

##  Quadrature with Gauss-Legendre nodes and weights
f <- function(x) sin(x+cos(10*exp(x))/3)
#\dontrun{ezplot(f, -1, 1, fill = TRUE)}
cc <- gaussLegendre(51, -1, 1)
Q <- sum(cc$w * f(cc$x))  #=> 0.0325036515865218 , true error: < 1e-15

# If f is not vectorized, do an explicit summation:
Q <- 0; x <- cc$x; w <- cc$w
for (i in 1:51) Q <- Q + w[i] * f(x[i])

# If f is infinite at b = 1, set  b <- b - eps  (with, e.g., eps = 1e-15)

# Use Gauss-Kronrod approach for error estimation
cc <- gaussLegendre(103, -1, 1)
abs(Q - sum(cc$w * f(cc$x)))     # rel.error < 1e-10

# Use Gauss-Hermite for vector-valued functions
f <- function(x) c(sin(pi*x), exp(x), log(1+x))
cc <- gaussLegendre(32, 0, 1)
drop(cc$w %*% matrix(f(cc$x), ncol = 3))  # c(2/pi, exp(1) - 1, 2*log(2) - 1)
# absolute error < 1e-15



