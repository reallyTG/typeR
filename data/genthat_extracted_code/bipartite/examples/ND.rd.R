library(bipartite)


### Name: ND
### Title: Normalised degree, betweenness and closeness centrality
### Aliases: ND BC CC
### Keywords: package

### ** Examples

## example:
data(olesen2002flores)
(ndi <- ND(olesen2002flores))
(cci <- CC(olesen2002flores))
(bci <- BC(olesen2002flores))

cor.test(bci[[1]], ndi[[1]], method="spear") # 0.532
cor.test(cci[[1]], ndi[[1]], method="spear") # 0.403

cor.test(bci[[2]], ndi[[2]], method="spear") # 0.738
cor.test(cci[[2]], ndi[[2]], method="spear") # 0.827
## Not run: 
##D ## PLANTS:
##D bc <- bci[[1]]
##D cc <- cci[[1]]
##D nd <- ndi[[1]]
##D # CC:
##D summary(nls(cc ~ a*nd+b, start=list(a=1,b=1))) # lower RSE
##D summary(nls(cc ~ c*nd^d, start=list(c=0.072,d=0.2))) 
##D # BC:
##D summary(nls(bc ~ a*nd+b, start=list(a=1,b=1)))
##D summary(nls(bc ~ c*nd^d, start=list(c=2,d=2))) # lower RSE
##D 
##D ## ANIMALS:
##D bc <- bci[[2]]
##D cc <- cci[[2]]
##D nd <- ndi[[2]]
##D # CC:
##D summary(nls(cc ~ a*nd+b, start=list(a=1,b=1)))  
##D summary(nls(cc ~ c*nd^d, start=list(c=0.2,d=2))) # lower RSE 
##D # BC:
##D summary(nls(bc ~ a*nd+b, start=list(a=1,b=1)))
##D summary(nls(bc ~ c*nd^d, start=list(c=0.2,d=2))) # lower RSE
## End(Not run)



