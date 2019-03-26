library(gclus)


### Name: order.clusters
### Title: Orders clustered objects using hierarchical clustering
### Aliases: order.clusters
### Keywords: multivariate cluster

### ** Examples

data(state)
state.d <- dist(state.x77)


# Order the states, keeping states in a division together.
state.o <- order.clusters(-state.d, as.numeric(state.division))
cmat <- dmat.color(as.matrix(state.d), rev(cm.colors(5)))


op <- par(mar=c(1,6,1,1))
rlabels <- state.name[state.o]
plotcolors(cmat[state.o,state.o], rlabels=rlabels)
par(op)


# Alternatively, use kmeans to place the  states into 6 clusters
state.km <- kmeans(state.d,6)$cluster

# An ordering obtained from the kmeans clustering...
state.o <- unlist(memship2clus(state.km))


layout(matrix(1:2,nrow=1,ncol=2),widths=c(0.1,1))
op <- par(mar=c(1,1,1,.2))
state.colors <- cbind(state.km,state.km)
plotcolors(state.colors[state.o,])

par(mar=c(1,6,1,1))
rlabels <- state.name[state.o]
plotcolors(cmat[state.o,state.o], rlabels=rlabels)

par(op)
layout(matrix(1,1))



# In the ordering above, the ordering of clusters and the
# ordering of objects within the clusters is arbitrary.
# order.clusters gives an improved order but preserves the kmeans clusters.

state.o <- order.clusters(-state.d, state.km)

# and replot
layout(matrix(1:2,nrow=1,ncol=2),widths=c(0.1,1))
op <- par(mar=c(1,1,1,.2))
state.colors <- cbind(state.km,state.km)
plotcolors(state.colors[state.o,])

par(mar=c(1,6,1,1))
rlabels <- state.name[state.o]
plotcolors(cmat[state.o,state.o], rlabels=rlabels)

par(op)
layout(matrix(1,1))




