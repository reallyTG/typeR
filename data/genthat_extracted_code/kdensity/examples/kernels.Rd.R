library(kdensity)


### Name: kernels
### Title: Kernel functions
### Aliases: kernels

### ** Examples

gaussian = list(
  kernel  = function(y, x, h) dnorm((y-x)/h),
  sd = 1,
  support = c(-Inf, Inf)
)

gcopula = list(
  kernel  = function(y, x, h) {
    rho = 1 - h^2
    inside = rho^2*(qnorm(y)^2 + qnorm(x)^2)-2*rho*qnorm(y)*qnorm(x)
    exp(-inside/(2*(1-rho^2)))
  },
  support = c(0, 1)
)




