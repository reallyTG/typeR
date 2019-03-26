library(spdep)


### Name: nb2blocknb
### Title: Block up neighbour list for location-less observations
### Aliases: nb2blocknb
### Keywords: spatial

### ** Examples

## Not run: 
##D data(boston, package="spData")
##D summary(as.vector(table(boston.c$TOWN)))
##D townaggr <- aggregate(boston.utm, list(town=boston.c$TOWN), mean)
##D block.rel <- graph2nb(relativeneigh(as.matrix(townaggr[,2:3])),
##D  as.character(townaggr[,1]), sym=TRUE)
##D block.rel
##D print(is.symmetric.nb(block.rel))
##D plot(block.rel, as.matrix(townaggr[,2:3]))
##D points(boston.utm, pch=18, col="lightgreen")
##D block.nb <- nb2blocknb(block.rel, as.character(boston.c$TOWN))
##D block.nb
##D print(is.symmetric.nb(block.nb))
##D plot(block.nb, boston.utm)
##D points(boston.utm, pch=18, col="lightgreen")
##D n.comp.nb(block.nb)$nc
##D moran.test(boston.c$CMEDV, nb2listw(boston.soi))
##D moran.test(boston.c$CMEDV, nb2listw(block.nb))
##D block.nb <- nb2blocknb(NULL, as.character(boston.c$TOWN))
##D block.nb
##D print(is.symmetric.nb(block.nb))
##D plot(block.nb, boston.utm)
##D n.comp.nb(block.nb)$nc
##D moran.test(boston.c$CMEDV, nb2listw(block.nb, zero.policy=TRUE), zero.policy=TRUE)
## End(Not run)



