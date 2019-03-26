library(vetools)


### Name: get.Grid.size
### Title: Build a grid around an object of class
###   '"SpatialPolygonsDataFrame"'
### Aliases: get.Grid.size
### Keywords: shapefile grid

### ** Examples
## Not run: 
##D ## Construct extremal grid for whole country
##D VE <- get.shape.state(get.shape.state()$Abb)
##D External.Grid <- get.Grid.size(VE)
##D 
##D ## Build grid over Amazona state synchronized with External.Grid
##D AM <- get.shape.state("AM")
##D AM.Grid <- get.Grid.size(AM, origin.grid=External.Grid)
##D 
##D ## Build grid over Amazona state
##D AM <- get.shape.state("AM")
##D AM.Grid <- get.Grid.size(AM)
##D 
##D ## Another example:
##D VE = get.shape.state(get.shape.state()$Abb)
##D ZUFACO = get.shape.state(c('ZU','FA','CO'))
##D Main.grid=get.Grid.size(VE,x.res=1,y.res=1,plot=T)
##D sub.grid = get.Grid.size(ZUFACO,origin.grid=Main.grid, x.res=0.5,y.res=0.5,plot=TRUE)
## End(Not run)



