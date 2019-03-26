## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----attach--------------------------------------------------------------
library(zoomgrid)

## ----contents------------------------------------------------------------
ls( grep("zoomgrid", search()) ) 

## ----rastrigin-----------------------------------------------------------
# Rastrigin function
ndim = 2 # number of dimension
nA = 10 # parameter A
# vx in [-5.12, 5.12]

# minimizer = rep(0, ndim)
# minimum = 0
Rastrigin <- function(vx) return(nA * ndim + sum(vx*vx - nA * cos(2*pi*vx)))

## ----optimize------------------------------------------------------------
# set seed and initialize the initial or starting value
set.seed(1)
par = runif(ndim, -5.12, 5.12)
cat("start from", par)

# results from different optimization algorithms
tmp1 = optim(par = par, Rastrigin, method='Nelder-Mead')
tmp2 = optim(par = par, Rastrigin, method='BFGS')
tmp3 = optim(par = par, Rastrigin, method='L-BFGS-B')
tmp4 = optim(par = par, Rastrigin, method='SANN')

tmp1$par; tmp1$value
tmp2$par; tmp2$value
tmp3$par; tmp3$value
tmp4$par; tmp4$value

## ----show, eval=F--------------------------------------------------------
#  ?build_grid

## ----build---------------------------------------------------------------
# build the grid
bin = c(from=-5.12, to=5.12, by=.1)
grid = build_grid(bin,bin)

## ----gs_nozoom-----------------------------------------------------------
# serial computation
ret1 = grid_search(Rastrigin, grid, silent=FALSE)
ret1$par

## ----pgs_nozoom, eval=F--------------------------------------------------
#  # parallel computation
#  ret2 = grid_search(Rastrigin, grid, num=2, parallel=TRUE, cores=2, silent=FALSE)
#  ret2$par

## ----pgs_zoom, eval=F----------------------------------------------------
#  # grid search with a zoom!
#  ret3 = grid_search(Rastrigin, grid, zoom=2, num=2, parallel=TRUE, cores=2, silent=FALSE)
#  ret3$par

## ----pgs_check, eval=F---------------------------------------------------
#  ret3 = grid_search_check(Rastrigin, grid, zoom=2, num=2, parallel=TRUE, cores=2, silent=FALSE)
#  ret3 = grid_search(Rastrigin, grid, zoom=2, num=2, parallel=TRUE, cores=2, silent=FALSE)

