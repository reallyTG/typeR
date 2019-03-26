library(agridat)


### Name: lin.superiority
### Title: Multi-environment trial of 33 barley genotypes in 12 locations
### Aliases: lin.superiority
### Keywords: datasets

### ** Examples

## Not run: 
##D 
##D data(lin.superiority)
##D dat <- lin.superiority
##D 
##D require(latticeExtra)
##D require(reshape2)
##D # calculate the superiority measure of Lin & Binns 1988
##D 
##D dat2 <- acast(dat, gen ~ loc, value.var="yield")
##D locmean <- apply(dat2, 2, mean)
##D locmax <- apply(dat2, 2, max)
##D P <- apply(dat2, 1, function(x) {
##D   sum((x-locmax)^2)/(2*length(x))
##D })/1000
##D P <- sort(P)
##D round(P) # match Lin & Binns 1988 table 2, column Pi
##D 
##D # atlantic & quebec regions overlap
##D # require(gge)
##D # m1 <- gge(yield ~ gen*loc, env.group=region, data=dat,
##D #           main="lin.superiority")
##D # biplot(m1)
##D 
##D # create a figure similar to Lin & Binns 1988
##D 
##D # add P, locmean, locmax back into the data
##D dat$locmean <- locmean[match(dat$loc, names(locmean))]
##D dat$locmax <- locmax[match(dat$loc, names(locmax))]
##D dat$P <- P[match(dat$gen, names(P))]
##D dat$gen <- reorder(dat$gen, dat$P)
##D xyplot(locmax ~ locmean|gen, data=dat,
##D        type=c('p','r'), as.table=TRUE, col="gray",
##D        main="lin.superiority - Superiority index",
##D        xlab="Location Mean",
##D        ylab="Yield of single cultivars (blue) & Maximum (gray)") +
##D   xyplot(yield ~ locmean|gen, data=dat,
##D          type=c('p','r'), as.table=TRUE, pch=19)
##D 
## End(Not run)



