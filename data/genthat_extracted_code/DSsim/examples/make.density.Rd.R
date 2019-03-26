library(DSsim)


### Name: make.density
### Title: Creates a Density object
### Aliases: make.density

### ** Examples

 
# A simple density surface with a constant value of 1 can be created within a rectangular 
# region using 
# the default values:
density <- make.density()
plot(density)
plot(make.region(), add = TRUE)
  
# The example below shows hot to add high and low point to the density surface                   
## Not run: 
##D pop.density <- make.density(region.obj = region, x.space = 10, 
##D  y.space = 10, constant = 0.5) 
##D  
##D pop.density <- add.hotspot(pop.density, centre = c(50, 200), 
##D  sigma = 100, amplitude = 0.1)
##D pop.density <- add.hotspot(pop.density, centre = c(500, 700), 
##D  sigma = 900, amplitude = 0.05)
##D pop.density <- add.hotspot(pop.density, centre = c(300, 100), 
##D  sigma = 100, amplitude = -0.15)
##D 
##D #New plot features
##D plot(pop.density)
##D plot(region, add = TRUE)
##D 
##D #Block style plotting
##D plot(pop.density, contours = FALSE, style = "blocks")
##D plot(region, add = TRUE)
##D 
## End(Not run)



