library(tbart)


### Name: allocations
### Title: Teitz-Bart algorithm applied to Spatial* and Spatial*DataFrame
###   objects
### Aliases: allocations

### ** Examples

require(RColorBrewer)
require(GISTools)
data(georgia)
georgia3 <- allocations(georgia2,p=5,force=c(1,120,44))
col.index <- match(georgia3$allocation,unique(georgia3$allocation))
col.alloc <- brewer.pal(5,'Accent')[col.index]
par(mfrow=c(1,2))
plot(georgia3,col=col.alloc)
choropleth(georgia3,georgia3$allocdist)


# Use in conjunction with rgeos
require(rgeos)
require(GISTools)
georgia3 <- allocations(georgia2,p=5,force=c(1,120,44))
georgia4 <- gUnaryUnion(georgia3,georgia3$allocation)
plot(georgia4)
plot(star.diagram(georgia3),col='darkred',lwd=2,add=TRUE)



