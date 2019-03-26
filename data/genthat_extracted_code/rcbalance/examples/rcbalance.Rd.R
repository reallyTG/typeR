library(rcbalance)


### Name: rcbalance
### Title: Optimal Matching with Refined Covariate Balance
### Aliases: rcbalance

### ** Examples

## Not run: 
##D library(optmatch)	
##D data(nuclearplants)
##D 
##D #require exact match on variables ne and pt, use rank-based Mahalanobis distance
##D my.dist.struct <- build.dist.struct(z = nuclearplants$pr, 
##D 	X = subset(nuclearplants[c('date','t1','t2','cap','bw','cum.n')]),
##D 	exact = paste(nuclearplants$ne, nuclearplants$pt, sep = '.'))
##D 
##D #match with refined covariate balance, first on ct then on (ct x bw)
##D rcbalance(my.dist.struct, fb.list = list('ct',c('ct','bw')),
##D  	treated.info = nuclearplants[which(nuclearplants$pr ==1),],
##D  	control.info = nuclearplants[which(nuclearplants$pr == 0),])
##D 
##D #repeat the same match using match_on tool from optmatch and regular Mahalanobis distance
##D exact.mask <- exactMatch(pr ~ ne + pt, data = nuclearplants)
##D my.dist.matrix <- match_on(pr ~ date + t1 + t2 + cap + bw + cum.n,
##D 	within = exact.mask, data = nuclearplants)
##D match.matrix <- 
##D 	rcbalance(my.dist.matrix*100, fb.list = list('ct',c('ct','bw')), 
##D 	treated.info = nuclearplants[which(nuclearplants$pr ==1),],
##D 	control.info = nuclearplants[which(nuclearplants$pr == 0),])
## End(Not run)



