library(ecoreg)


### Name: integrate.gh
### Title: Univariate Gauss-Hermite integration
### Aliases: integrate.gh
### Keywords: math

### ** Examples

## Want the integral of h over the real line
g <- function(x) 4 * exp( - ((1 - x)^2 + 1))
h <- function(x) g(x) * dnorm(x)
integrate(h, -Inf, Inf)
integrate.gh(h)
## Not very accurate with default 10 points. Either use more quadrature points, 
integrate.gh(h, points=30)
## or shift and scale the points.
opt <- nlm(function(x) -g(x), 0, hessian=TRUE)
integrate.gh(h, mu=opt$estimate, scale=1/sqrt(opt$hessian))




