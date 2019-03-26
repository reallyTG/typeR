library(EQL)


### Name: cumulants
### Title: Cumulants Class For Saddlepoint Approximations
### Aliases: cumulants gammaCumulants gaussianCumulants
###   inverseGaussianCumulants check.cumulants

### ** Examples

# Define cumulant functions for the normal distribution

saddlef <- function(x, mu, sigma2) (x-mu)/sigma2
cgf <- function(x, mu, sigma2) mu*x+sigma2*x^2/2

## Not run: 
##D 
##D # cgf, saddlef, kappa2, rho3 and rho4 must have the same argument lists! 
##D # Functions are _not_ properly vectorized!
##D kappa2 <- function(x, sigma2) sigma2 
##D rho3 <- function(x) 0                 
##D rho4 <- function(x) 0
##D 
##D cc <- cumulants(saddlef, cgf, kappa2, rho3, rho4, mu=0, sigma2=1)
##D 
##D check(cc) # FALSE
##D 
## End(Not run)

kappa2 <- function(x, mu, sigma2)
    rep(sigma2, length(x)) 
rho3 <- function(x, mu, sigma2)   # or function(x, ...)
    rep(0, length(x))        
rho4 <- function(x, mu, sigma2)   # or function(x, ...)
    rep(0, length(x))        

cc <- cumulants(saddlef, cgf, kappa2, rho3, rho4, mu=0, sigma2=1)

cc$K(1:2)       # 0.5 2
cc$kappa2(1:2)  # 1 1
cc$mu.inv(1:2)  # 1 2
cc$rho3(1:2)    # 0 0
cc$rho4(1:2)    # 0 0

check(cc) # TRUE

# The same using the generic derivative of the cgf

K.deriv <- function(n, x, mu, sigma2) {
  if (n <= 2) {
    switch(n + 1,
           return(mu * x + sigma2 * x ^ 2 / 2), # n == 0
           return(mu + sigma2 * x),             # n == 1
           return(rep(sigma2, length(x))))      # n == 2
  } else {
    return(rep(0, length(x)))                   # n >= 3
  }
}

cc <- cumulants(saddlef, cgf.deriv=K.deriv, mu=0, sigma2=1)

cc$K(1:2)       # 0.5 2
cc$kappa2(1:2)  # 1 1
cc$mu.inv(1:2)  # 1 2
cc$rho3(1:2)    # 0 0
cc$rho4(1:2)    # 0 0

check(cc) # TRUE

# The same using a predefined function
cc <- gaussianCumulants(0, 1)

cc$K(1:2)       # 0.5 2
cc$kappa2(1:2)  # 1 1
cc$mu.inv(1:2)  # 1 2
cc$rho3(1:2)    # 0 0
cc$rho4(1:2)    # 0 0

check(cc) # TRUE




