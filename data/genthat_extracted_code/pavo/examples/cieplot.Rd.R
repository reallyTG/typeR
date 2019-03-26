library(pavo)


### Name: cieplot
### Title: CIE plot
### Aliases: cieplot
### Keywords: internal

### ** Examples

## Not run: 
##D data(flowers)
##D 
##D # CIEXYZ
##D vis.flowers <- vismodel(flowers, visual = 'cie10', illum = 'D65', vonkries = TRUE, relative = FALSE)
##D xyz.flowers <- colspace(vis.flowers, space = 'ciexyz')
##D plot(xyz.flowers)
##D 
##D #CIELAB
##D lab.flowers <- colspace(vis.flowers, space = 'cielab')
##D plot(lab.flowers)
## End(Not run)




