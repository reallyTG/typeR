library(qtl)


### Name: plotMap
### Title: Plot genetic map
### Aliases: plotMap plot.map
### Keywords: hplot

### ** Examples

data(fake.bc)
## Don't show: 
fake.bc <- subset(fake.bc, chr=18:19)
## End(Don't show)
plotMap(fake.bc)
plotMap(fake.bc,horizontal=TRUE)

newmap <- est.map(fake.bc)
plot(newmap)
plotMap(fake.bc, newmap)

plotMap(fake.bc, show.marker.names=TRUE)




