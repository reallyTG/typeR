library(NMOF)


### Name: divRatio
### Title: Diversification Ratio
### Aliases: divRatio

### ** Examples

na  <- 10     ## number of assets
rho <- 0.5    ## correlation
v_min <- 0.2  ## minimum vol
v_max <- 0.4  ## maximum vol

## set up a covariance matrix S
C <- array(rho, dim = c(na,na))
diag(C) <- 1
vols <- seq(v_min, v_max, length.out = na)
S <- outer(vols, vols) * C

w <- rep(1/na, na)  ## weights
divRatio(w, S)




