library(SensoMineR)


### Name: IdMap
### Title: Ideal Mapping (IdMap)
### Aliases: IdMap
### Keywords: multivariate

### ** Examples

## Not run: 
##D data(perfume_ideal)
##D 
##D #! For the IdMap
##D res.IdMap <- IdMap(perfume_ideal, col.p=2, col.j=1, 
##D    col.lik=ncol(perfume_ideal), id.recogn="id_")
##D plot.IdMap(res.IdMap, xlim=c(-7,10), ylim=c(-5,7), levels.contour=NULL, color=TRUE)
##D 
##D #! For the wIdMap
##D res.wIdMap <- IdMap(perfume_ideal, col.p=2, col.j=1, col.lik=ncol(perfume_ideal), 
##D    id.recogn="id_", cons.eq=TRUE)
## End(Not run)



