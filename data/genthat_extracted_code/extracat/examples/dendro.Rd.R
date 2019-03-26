library(extracat)


### Name: dendro
### Title: Waterfall Dendrogram
### Aliases: dendro

### ** Examples

## Not run: 
##D library(amap)
##D hc <- hcluster(USArrests)
##D # the full plot:
##D dendro(hc, k = 24, min.gap = 0.00)
##D 
##D # aggregation splits within 0.02 maximum height
##D dendro(hc, k = 24, min.gap = 0.02)
##D 
##D # the same graphic with spline curves instead of straight lines.
##D dendro(hc, k = 24, min.gap = 0.02, spline = TRUE)
##D 
##D # olive oil data
##D sx <- scale(olives[,-c(1,2,11)])
##D hc <- hcluster(sx)
##D plot(hc)
##D dendro(hc, 120, color.id = 6, min.gap=0.005)
##D dendro(hc, 120, color.id = 6, min.gap=0.1)
##D 
##D dendro(hc, 120, color.id = 6, min.gap=0.1, spline = TRUE)
## End(Not run)



