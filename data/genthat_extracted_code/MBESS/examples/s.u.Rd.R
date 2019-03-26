library(MBESS)


### Name: s.u
### Title: Unbiased estimate of the population standard deviation
### Aliases: s.u
### Keywords: design htest

### ** Examples

set.seed(113)
X <- rnorm(10, 100, 15)

# Square root of the unbiased estimate of the variance (not unbiased)
var(X)^.5

# One way to implement the function.
s.u(s=var(X)^.5, N=length(X))

# Another way to implement the function.
s.u(X=X)



