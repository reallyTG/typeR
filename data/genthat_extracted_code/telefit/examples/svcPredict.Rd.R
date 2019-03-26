library(telefit)


### Name: svcPredict
### Title: Make predictions using a fitted varying coefficient model
### Aliases: svcPredict

### ** Examples

library(fields)
library(mvtnorm)

set.seed(2018)

# set key parameters
dims = list(N=100, nt=3, k=2, p=2)
params = list(sigmasq=.2, rho=.3, eps=.5, nu=.5)

# generate parameters and data
coords = matrix( runif(2 * dims$N), ncol = 2 )
X = matrix( rnorm(dims$p * dims$N * dims$nt), ncol = dims$p )
beta = c(-1, .5)
z = matrix( rnorm(dims$k * dims$nt), ncol = dims$nt)
H = maternCov(rdist.earth(coords), scale = params$sigmasq, range = params$rho,
              smoothness = params$nu, nugget = params$sigmasq * params$eps)
Hinv = solve(H)
Tm = matrix(c(.5,.2, .2, .5), ncol=2)/2
theta = kronSamp(Hinv, Tm)


# generate response
xb = X %*% beta
zt = as.numeric(apply(z, 2, function(d) { 
  kronecker(diag(dims$N), t(d)) %*% theta }))
w = kronSamp(diag(dims$nt), H)
y =  xb + zt + w


# fit model
it = 100
priors = list(
  T = list(Psi = .1*diag(dims$k), nu = dims$k),
  beta = list(Linv = diag(dims$p) * 1e-2),
  sigmasq = list(a=2, b=1),
  rho = list(L=0, U=1),
  cov = list(nu=.5)
)

fit = svcFit(y=y, X=X, z=z, coords=coords, priors=priors, nSamples=it)


#
# predict at new timepoints
#

# generate parameters and data
nt0 = 3
Xn = matrix( rnorm(dims$p * dims$N * nt0), ncol = dims$p )
zn = matrix( rnorm(dims$k * nt0), ncol = nt0)

# generate response
xbn = Xn %*% beta
ztn = as.numeric(apply(zn, 2, function(d) { 
  kronecker(diag(dims$N), t(d)) %*% theta }))
wn = kronSamp(diag(nt0), H)
yn =  xbn + ztn + wn

# predict responses
pred = svcPredict(fit, Xn, zn, burn = 50)




