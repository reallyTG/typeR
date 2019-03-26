library(ggmcmc)


### Name: ggs_pairs
### Title: Create a plot matrix of posterior simulations
### Aliases: ggs_pairs

### ** Examples

## Not run: 
##D library(GGally)
##D data(linear)
##D 
##D # default ggpairs plot
##D ggs_pairs(ggs(s))
##D 
##D # change alpha transparency of points
##D ggs_pairs(ggs(s), lower=list(continuous = wrap("points", alpha = 0.2)))
##D 
##D # with too many points, try contours instead
##D ggs_pairs(ggs(s), lower=list(continuous="density"))
##D 
##D # histograms instead of univariate densities on diagonal
##D ggs_pairs(ggs(s), diag=list(continuous="barDiag"))
##D 
##D # coloring results according to chains
##D ggs_pairs(ggs(s), mapping = aes(color = Chain))
##D 
##D # custom points on lower panels, black contours on upper panels
##D ggs_pairs(ggs(s),
##D   upper=list(continuous = wrap("density", color = "black")),
##D   lower=list(continuous = wrap("points", alpha = 0.2, shape = 1)))
## End(Not run)



