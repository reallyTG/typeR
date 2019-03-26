library(lmomco)


### Name: lmomgam
### Title: L-moments of the Gamma Distribution
### Aliases: lmomgam
### Keywords: L-moment (distribution) Distribution: Gamma Distribution:
###   Generalized Gamma

### ** Examples

lmomgam(pargam(lmoms(c(123,34,4,654,37,78))))

## Not run: 
##D # 3-p Generalized Gamma Distribution and comparisons of 3-p Gam parameterization.
##D #     1st parameter A[lmomco] = A[gamlss] =  exp(A[flexsurv])
##D #     2nd parameter B[lmomco] = B[gamlss] =      B[flexsurv]
##D #     3rd parameter C[lmomco] = C[gamlss] -->    C[flexsurv] = B[lmomco]/C[lmomco]
##D lmomgam(vec2par(c(7.4, 0.2, 14), type="gam"), nmom=5)$lambdas      # numerics
##D lmoms(gamlss.dist::rGG(50000, mu=7.4, sigma=0.2, nu=14))$lambdas   # simulation
##D lmoms(flexsurv::rgengamma(50000, log(7.4), 0.2, Q=0.2*14))$lambdas # simulation
##D #[1]  5.364557537  1.207492689 -0.110129217  0.067007941 -0.006747895
##D #[1]  5.366707749  1.209455502 -0.108354729  0.066360223 -0.006716783
##D #[1]  5.356166684  1.197942329 -0.106745364  0.069102821 -0.008293398#
## End(Not run)



