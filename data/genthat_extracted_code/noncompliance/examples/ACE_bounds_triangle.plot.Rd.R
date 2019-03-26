library(noncompliance)


### Name: ACE_bounds_triangle.plot
### Title: "Triangle" plot of the posterior bounds for the Average Causal
###   Effect (ACE).
### Aliases: ACE_bounds_triangle.plot

### ** Examples

ace.bnds.lipid <- ACE_bounds_posterior(158, 14, 0, 0, 52, 12, 23, 78,
     prior = c( rep(1, 2), rep(0, 2), rep(1, 4)))
ACE_bounds_triangle.plot(ace.bnds.lipid, "Bounds on ACE for Lipid Data")
## Not run: 
##D ace.bnds.lipid <- ACE_bounds_posterior(158, 14, 0, 0, 52, 12, 23, 78,
##D      prior = c( rep(1, 2), rep(0, 2), rep(1, 4)), num.sims = 2e4)
##D ACE_bounds_triangle.plot(ace.bnds.lipid, "Bounds on ACE for Lipid Data") 
## End(Not run)



