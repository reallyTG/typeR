library(dendextend)


### Name: rllply
### Title: recursivly apply a function on a list
### Aliases: rllply

### ** Examples

## Not run: 
##D x <- list(1)
##D x
##D rllply(x, function(x){x}, add_notation  = TRUE)
##D 
##D x <- list(1, 2, list(31))
##D x
##D rllply(x, function(x){x}, add_notation  = TRUE)
##D                      # the first element is the entire tree
##D                            # after FUN was applied to its root element.
##D 
##D hc <- hclust(dist(USArrests[1:4,]), "ave")
##D dend <- as.dendrogram(hc)
##D rllply(dend, function(x){attr(x, "height")})
##D rllply(dend, function(x){attr(x, "members")})
## End(Not run)



