library(copBasic)


### Name: gridCOP
### Title: Compute a Copula on a Grid
### Aliases: gridCOP
### Keywords: copula utility copulatic surface

### ** Examples

## Not run: 
##D the.grid <- gridCOP(cop=PSP)
##D the.grid[1,1] <- 0 # replace the NaN
##D image(the.grid) # ramps to the upper right 
## End(Not run)

## Not run: 
##D # See this composite copula also used in densityCOPplot() documentation.
##D para <- list(alpha=0.15, beta=0.90, kappa=0.06, gamma=0.96,
##D              cop1=GHcop, cop2=PLACKETTcop, para1=5.5, para2=0.07)
##D GR <- gridCOP(cop=composite2COP, para=para, delta=0.005)
##D image(GR, col=terrain.colors(20)) # asymmetric, high curvature in top half 
## End(Not run)



