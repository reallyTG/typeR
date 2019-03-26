library(zoon)


### Name: FindExtent
### Title: Determine the Extent of Interest
### Aliases: FindExtent

### ** Examples

## Not run: 
##D  # open a world map and click on two spots to print the extent to the console
##D  FindExtent()
##D 
##D  # you can get the corresponding extent object too
##D  ext <- FindExtent()
##D  ext
##D 
##D  # you can zoom in on an area and increase the resolution, and precision of
##D  # the extent vector
##D  FindExtent(c(112, 156, -44, -8),
##D             resolution = "medium",
##D             round = 6)
## End(Not run)



