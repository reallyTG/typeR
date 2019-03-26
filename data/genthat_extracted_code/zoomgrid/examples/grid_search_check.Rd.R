library(zoomgrid)


### Name: grid_search_check
### Title: Check the time consumed by running the grid search algorithm
###   with a zoom.
### Aliases: grid_search_check
### Keywords: algorithms

### ** Examples

# Rastrigin function
ndim = 2 # number of dimension
nA = 10 # parameter A
# vx in [-5.12, 5.12]

# minimizer = rep(0, ndim)
# minimum = 0
Rastrigin <- function(vx) return(nA * ndim + sum(vx*vx - nA * cos(2*pi*vx)))

# a toy example
# build the grid first
bin = c(from=-5.12, to=5.12, by=.5)
grid = build_grid(bin,bin)
# so this is a relatively sparse grid

# serial computation
ret0 = grid_search(Rastrigin, grid, silent=FALSE)
ret0$par

## No test: 
# If we expand the grid to allow for more points
bin = c(from=-5.12, to=5.12, by=.1)
grid = build_grid(bin,bin)

# run the check before the grid search
ret1 = grid_search_check(Rastrigin, grid, silent=FALSE)
ret1 = grid_search(Rastrigin, grid, silent=FALSE)
## End(No test)




