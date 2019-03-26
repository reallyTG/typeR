library(gclus)


### Name: order.single
### Title: Orders objects using hierarchical clustering
### Aliases: order.single order.endlink order.hclust
### Keywords: multivariate cluster

### ** Examples

data(state)
state.cor <- cor(state.x77)
order.single(state.cor)
order.endlink(state.cor)
order.hclust(state.cor,method="average")

# Use for plotting...

cpairs(state.x77, panel.colors=dmat.color(state.cor), order.single(state.cor),pch=".",gap=.4)
cparcoord(state.x77, order.endlink(state.cor),panel.colors=dmat.color(state.cor))


# Order the states instead of the variables...

state.d <- dist(state.x77)
state.o <- order.single(-state.d)

op <- par(mar=c(1,6,1,1))
cmat <- dmat.color(as.matrix(state.d), rev(cm.colors(5)))
plotcolors(cmat[state.o,state.o], rlabels=state.name[state.o])
par(op)





