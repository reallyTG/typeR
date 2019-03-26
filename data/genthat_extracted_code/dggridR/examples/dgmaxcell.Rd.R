library(dggridR)


### Name: dgmaxcell
### Title: Get largest cell id for a dggs
### Aliases: dgmaxcell

### ** Examples

## Not run: 
##D #Choose a set of cells randomly distributed over the Earth
##D library(dggridR)
##D dggs    <- dgconstruct(spacing=1000, metric=FALSE, resround='down')
##D N       <- 100                                 #Number of cells
##D maxcell <- dgmaxcell(dggs)                     #Get maximum cell id
##D cells   <- sample(1:maxcell, N, replace=FALSE) #Choose random cells
##D grid    <- dgcellstogrid(dggs,cells,frame=TRUE,wrapcells=TRUE) #Get grid
## End(Not run)



