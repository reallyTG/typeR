library(gclus)


### Name: pclen
### Title: Profile smoothness measures
### Aliases: pclen pcglen
### Keywords: hplot multivariate

### ** Examples

x <- runif(20)
y <- runif(20)
pclen(x,y)


data(state)
mins <- apply(state.x77,2,min)
ranges <- apply(state.x77,2,max) - mins
state.m <- -colpairs(scale(state.x77,mins,ranges), pclen)
state.col <- dmat.color(state.m)
cparcoord(state.x77, panel.color= state.col)
# Get rid of the panels with long line segments (yellow) by reordering:
cparcoord(state.x77, order.endlink(state.m), state.col)




