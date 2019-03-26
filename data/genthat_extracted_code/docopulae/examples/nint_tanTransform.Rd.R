library(docopulae)


### Name: nint_tanTransform
### Title: Tangent Transform
### Aliases: nint_tanTransform

### ** Examples

mu = 1e0
sigma = mu/3
f = function(x) dnorm(x, mean=mu, sd=sigma)
space = nint_space(nint_intvDim(-Inf, Inf))

tt = nint_transform(f, space, list(nint_tanTransform(0, 1, dIdcs=1)))
tt$space
ff = Vectorize(tt$f); curve(ff(x), tt$space[[1]][1], tt$space[[1]][2])

nint_integrate(tt$f, tt$space) # should return 1

# same with larger mu
mu = 1e4
sigma = mu/3
f = function(x) dnorm(x, mean=mu, sd=sigma)

tt = nint_transform(f, space, list(nint_tanTransform(0, 1, dIdcs=1)))
ff = Vectorize(tt$f); curve(ff(x), tt$space[[1]][1], tt$space[[1]][2])

try(nint_integrate(tt$f, tt$space)) # integral is probably divergent

# same with different transformation
tt = nint_transform(f, space, list(nint_tanTransform(mu, sigma, dIdcs=1)))
ff = Vectorize(tt$f); curve(ff(x), tt$space[[1]][1], tt$space[[1]][2])

nint_integrate(tt$f, tt$space) # should return 1



