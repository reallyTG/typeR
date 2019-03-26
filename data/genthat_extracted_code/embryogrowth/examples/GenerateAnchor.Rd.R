library(embryogrowth)


### Name: GenerateAnchor
### Title: Generate a set of anchored parameters
### Aliases: GenerateAnchor

### ** Examples

## Not run: 
##D # Example to generate anchored parameters
##D newp <- GenerateAnchor()
##D newp <- GenerateAnchor(temperatures=seq(from=20, 
##D   to=35, length.out=7))
##D newp <- GenerateAnchor(number.anchors=7)
##D data(nest)
##D formated <- FormatNests(nest, previous=NULL)
##D newp <- GenerateAnchor(nests=formated)
##D newp <- GenerateAnchor(nests=formated, number.anchors=10)
##D data(resultNest_4p_SSM4p)
##D newp <- GenerateAnchor(nests=resultNest_4p_SSM4p, number.anchors=7)
##D newp <- GenerateAnchor(nests=resultNest_4p_SSM4p, temperatures=seq(from=20,
##D  to=35, length.out=10))
##D newp <- GenerateAnchor(nests=resultNest_4p_SSM4p, number.anchors=7)
##D newp <- c(newp, Scale=1)
## End(Not run)



