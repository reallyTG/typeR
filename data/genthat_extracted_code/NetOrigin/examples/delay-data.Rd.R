library(NetOrigin)


### Name: delay-data
### Title: Delay propagation data examples simulated by LinTim software
### Aliases: delay-data delayAth delayGoe
### Keywords: data

### ** Examples

## Not run: 
##D  
##D # compute effective distance
##D data(ptnAth)
##D athnet <- igraph::as_adjacency_matrix(ptnAth, sparse=FALSE)
##D p <- athnet/rowSums(athnet)
##D eff <- eff_dist(p)
##D # apply source estimation
##D if (requireNamespace("aplyr", quietly = TRUE)) {
##D data(delayAth)
##D res <- alply(.data=delayAth[,-c(1:2)], .margins=1, .fun=origin_edm, distance=eff,
##D              silent=TRUE, .progress='text')
##D perfAth <- ldply(Map(performance, x = res, start = as.list(delayAth$k0),  
##D                      list(graph = ptnAth)))
##D }
## End(Not run) 
## Not run: 
##D  
##D # compute effective distance
##D data(ptnGoe)
##D goenet <- igraph::as_adjacency_matrix(ptnGoe, sparse=FALSE)
##D p <- goenet/rowSums(goenet)
##D eff <- eff_dist(p)
##D # apply source estimation
##D if (requireNamespace("aplyr", quietly = TRUE)) {
##D data(delayGoe)
##D res <- alply(.data=delayGoe[,-c(1:2)], .margins=1, .fun=origin_edm, distance=eff,
##D              silent=TRUE, .progress='text')
##D perfGoe <- ldply(Map(performance, x = res, start = as.list(delayGoe$k0), 
##D                      list(graph = ptnGoe)))
##D }
## End(Not run) 



