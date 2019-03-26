library(RSAGA)


### Name: rsaga.grid.calculus
### Title: SAGA Module Grid Calculus
### Aliases: rsaga.grid.calculus rsaga.linear.combination
### Keywords: interface spatial

### ** Examples

## Not run: 
##D # using SAGA grids:
##D # calculate the NDVI from Landsat TM bands 3 and 4:
##D rsaga.grid.calculus(c("tm3.sgrd","tm4.sgrd"), "ndvi.sgrd", ~(a-b)/(a+b))
##D # apply a linear regression equation to grids:
##D coefs = c(20,-0.6)
##D # maybe from a linear regression of mean annual air temperature (MAAT)
##D # against elevation - something like:
##D # coefs = coef( lm( maat ~ elevation ) )
##D rsaga.linear.combination("elevation.sgrd", "maat.sgrd", coefs)
##D # equivalent:
##D rsaga.grid.calculus("elevation.sgrd", "maat.sgrd", "20 - 0.6*a")
## End(Not run)



