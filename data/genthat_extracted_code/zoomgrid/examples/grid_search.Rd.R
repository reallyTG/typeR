library(zoomgrid)


### Name: grid_search
### Title: Carry out the grid search algorithm with a zoom.
### Aliases: grid_search
### Keywords: algorithms

### ** Examples

# Rastrigin function
ndim = 2 # number of dimension
nA = 10 # parameter A
# vx in [-5.12, 5.12]

# minimizer = rep(0, ndim)
# minimum = 0
Rastrigin <- function(vx) return(nA * ndim + sum(vx*vx - nA * cos(2*pi*vx)))

## No test: 
# set seed and initialize the initial or starting value
set.seed(1)
par = runif(ndim, -5.12, 5.12)
cat("start from", par)

# results from different optimization algorithms
optim(par = par, Rastrigin, method='Nelder-Mead')
optim(par = par, Rastrigin, method='BFGS')
optim(par = par, Rastrigin, method='L-BFGS-B')
optim(par = par, Rastrigin, method='SANN')
## End(No test)

# a toy example
# build the grid first
bin = c(from=-5.12, to=5.12, by=.5)
grid = build_grid(bin,bin)
# so this is a relatively sparse grid

# serial computation
ret0 = grid_search(Rastrigin, grid, silent=FALSE)
ret0$par

## No test: 

# We can build a finer grid
bin = c(from=-5.12, to=5.12, by=.1)
grid = build_grid(bin,bin)

# serial computation
ret1 = grid_search(Rastrigin, grid, silent=FALSE)
ret1$par

# parallel computation
ret2 = grid_search(Rastrigin, grid, num=2, parallel=TRUE, silent=FALSE)
ret2$par

# grid search with a zoom!
ret3 = grid_search(Rastrigin, grid, zoom=2, num=2, parallel=TRUE, silent=FALSE)
ret3$par
## End(No test)




