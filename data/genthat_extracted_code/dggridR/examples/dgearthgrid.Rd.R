library(dggridR)


### Name: dgearthgrid
### Title: Return the coordinates constituting the boundary of cells for
###   the entire Earth
### Aliases: dgearthgrid

### ** Examples

## Not run: 
##D library(dggridR)
##D dggs         <- dgconstruct(res=20)
##D res          <- dg_closest_res_to_spacing(dggs,spacing=1000,round='down',metric=FALSE)
##D dggs         <- dgsetres(dggs,res)
##D gridfilename <- dgearthgrid(dggs,savegrid="temp.shp") #Save directly to a file
## End(Not run)



