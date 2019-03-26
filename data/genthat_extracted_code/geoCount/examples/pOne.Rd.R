library(geoCount)


### Name: pOne
### Title: Calculate One-side P-value
### Aliases: pOne
### Keywords: Transformed Residual Checking

### ** Examples

## Not run: 
##D # For single value
##D pOne(2, rnorm(10000)) 
##D # Visualize with plot_pRPS()
##D plot_pRPS(2, rnorm(10000), nm="d")
##D # For vector
##D pOne(1:3, matrix(rnorm(30000),,3))
## End(Not run)



