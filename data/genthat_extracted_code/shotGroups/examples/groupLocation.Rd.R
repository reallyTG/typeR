library(shotGroups)


### Name: groupLocation
### Title: Accuracy: Location measures for a single group of bullet holes
### Aliases: groupLocation groupLocation.data.frame groupLocation.default

### ** Examples

# coordinates given by a suitable data frame
res <- groupLocation(DFsavage, dstTarget=100, conversion='m2mm',
                     level=0.95, plots=2, bootCI='basic')
names(res)
res$ctr
res$distPOA
res$ctrXci
res$ctrYci

# coordinates given by a matrix
## Not run: 
##D # assume data from pistol shooting at 25m with 9mm ammo
##D # metric units
##D xy <- matrix(round(rnorm(100, 0, 5), 2), ncol=2)
##D groupLocation(xy, dstTarget=25, conversion='m2cm', plots=2)
## End(Not run)



