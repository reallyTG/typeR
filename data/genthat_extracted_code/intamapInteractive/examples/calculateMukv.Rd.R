library(intamapInteractive)


### Name: calculateMukv
### Title: MUKV computation
### Aliases: calculateMukv
### Keywords: spatial

### ** Examples

## Not run: 
##D # load data:
##D data(meuse)
##D coordinates(meuse) = ~x+y
##D data(meuse.grid)
##D coordinates(meuse.grid) = ~x+y
##D gridded(meuse.grid) = TRUE
##D meuse.grid$soil = factor(meuse.grid$soil)
##D 
##D # estimate variogram:
##D smplvarUK = variogram(zinc~dist+ffreq+soil, meuse)
##D plot(smplvarUK)
##D vfitUK = fit.variogram(variogram(zinc~dist+ffreq+soil, meuse), vgm(1, "Exp", 300, 1))
##D plot(smplvarUK, vfitUK)
##D 
##D calculateMukv(meuse, meuse.grid, vfitUK, zinc~dist+ffreq+soil)
##D 
## End(Not run)



