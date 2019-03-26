library(docopulae)


### Name: nint_transform
### Title: Transform Integral
### Aliases: nint_transform

### ** Examples

library(mvtnorm)
library(SparseGrid)

dfltNCube = nint_integrateNCube


## 1D, normal pdf
mu = 137
sigma = mu/6
f = function(x) dnorm(x, mean=mu, sd=sigma)
space = nint_space(nint_intvDim(-Inf, Inf))

tt = nint_transform(f, space,
                    list(nint_tanTransform(mu + 3, sigma*1.01, dIdcs=1)))
tt$space
ff = Vectorize(tt$f); curve(ff(x), tt$space[[1]][1], tt$space[[1]][2])

nint_integrate(tt$f, tt$space) # returns 1


## 2D, normal pdf

## prepare for SparseGrid
ncube = function(dimension)
    SparseGrid::createIntegrationGrid('GQU', dimension, 7) # rather sparse!
ncube = nint_integrateNCube_SparseGrid(ncube)
unlockBinding('nint_integrateNCube', environment(nint_integrate))
assign('nint_integrateNCube', ncube, envir=environment(nint_integrate))

mu = c(1, 2)
sigma = matrix(c(1, 0.7,
                 0.7, 2), nrow=2)
f = function(x) {
    if (all(is.infinite(x))) # dmvnorm returns NaN in this case
        return(0)
    return(dmvnorm(x, mean=mu, sigma=sigma))
}

# plot f
x1 = seq(-1, 3, length.out=51); x2 = seq(-1, 5, length.out=51)
y = outer(x1, x2, function(x1, x2) apply(cbind(x1, x2), 1, f))
contour(x1, x2, y, xlab='x[1]', ylab='x[2]', main='f')

space = nint_space(nint_intvDim(-Inf, Inf),
                   nint_intvDim(-Inf, Inf))

tt = nint_transform(f, space,
                    list(nint_tanTransform(mu, diag(sigma), dIdcs=1:2)))
tt$space

# plot tt$f
x1 = seq(tt$space[[1]][1], tt$space[[1]][2], length.out=51)
x2 = seq(tt$space[[2]][1], tt$space[[2]][2], length.out=51)
y = outer(x1, x2, function(x1, x2) apply(cbind(x1, x2), 1, tt$f))
contour(x1, x2, y, xlab='x[1]', ylab='x[2]', main='tt$f')

nint_integrate(tt$f, tt$space) # doesn't return 1
# tan transform is inaccurate here

# probability integral transform
dsigma = diag(sigma)
t1 = list(g=function(x) pnorm(x, mean=mu, sd=dsigma),
          giDg=function(y) {
              x = qnorm(y, mean=mu, sd=dsigma)
              list(x, dnorm(x, mean=mu, sd=dsigma))
          },
          dIdcs=1:2)

tt = nint_transform(f, space, list(t1))

# plot tt$f
x1 = seq(tt$space[[1]][1], tt$space[[1]][2], length.out=51)
x2 = seq(tt$space[[2]][1], tt$space[[2]][2], length.out=51)
y = outer(x1, x2, function(x1, x2) apply(cbind(x1, x2), 1, tt$f))
contour(x1, x2, y, xlab='x[1]', ylab='x[2]', main='tt$f')

nint_integrate(tt$f, tt$space) # returns almost 1


## 2D, half sphere
f = function(x) sqrt(1 - x[1]^2 - x[2]^2)
space = nint_space(nint_intvDim(-1, 1),
                   nint_funcDim(function(x)
                        nint_intvDim(c(-1, 1)*sqrt(1 - x[1]^2))))

# plot f
x = seq(-1, 1, length.out=51)
y = outer(x, x, function(x1, x2) apply(cbind(x1, x2), 1, f))
persp(x, x, y, theta=45, phi=45, xlab='x[1]', ylab='x[2]', zlab='f')

tt = nint_transform(f, space, list())
tt$space

# plot tt$f
x1 = seq(tt$space[[1]][1], tt$space[[1]][2], length.out=51)
x2 = seq(tt$space[[2]][1], tt$space[[2]][2], length.out=51)
y = outer(x1, x2, function(x1, x2) apply(cbind(x1, x2), 1, tt$f))
persp(x1, x2, y, theta=45, phi=45, xlab='x[1]', ylab='x[2]', zlab='tt$f')

nint_integrate(tt$f, tt$space) # returns almost 4/3*pi / 2


## 2D, constrained normal pdf
f = function(x) prod(dnorm(x, 0, 1))
space = nint_space(nint_intvDim(-Inf, Inf),
                   nint_funcDim(function(x) nint_intvDim(-Inf, x[1]^2)))

tt = nint_transform(f, space, list(nint_tanTransform(0, 1, dIdcs=1:2)))

# plot tt$f
x1 = seq(tt$space[[1]][1], tt$space[[1]][2], length.out=51)
x2 = seq(tt$space[[2]][1], tt$space[[2]][2], length.out=51)
y = outer(x1, x2, function(x1, x2) apply(cbind(x1, x2), 1, tt$f))
persp(x1, x2, y, theta=45, phi=45, xlab='x[1]', ylab='x[2]', zlab='tt$f')

nint_integrate(tt$f, tt$space) # Mathematica returns 0.716315


assign('nint_integrateNCube', dfltNCube, envir=environment(nint_integrate))



