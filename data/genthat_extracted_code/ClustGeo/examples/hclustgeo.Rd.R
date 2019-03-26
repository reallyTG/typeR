library(ClustGeo)


### Name: hclustgeo
### Title: Hierarchical clustering with geographical contraints
### Aliases: hclustgeo

### ** Examples

data(estuary)
# with one dissimilarity matrix
w <- estuary$map@data$POPULATION # non uniform weights 
D <- dist(estuary$dat)
tree <- hclustgeo(D,wt=w)
sum(tree$height)
inertdiss(D,wt=w)
inert(estuary$dat,w=w)
plot(tree,labels=FALSE)
part <- cutree(tree,k=5)
sp::plot(estuary$map,border="grey",col=part)

# with two dissimilarity matrix
D0 <- dist(estuary$dat) # the socio-demographic distances
D1 <- as.dist(estuary$D.geo) # the geographical distances
alpha <- 0.2 # the mixing parameter
tree <- hclustgeo(D0,D1,alpha=alpha,wt=w)
plot(tree,labels=FALSE)
part <- cutree(tree,k=5)
sp::plot(estuary$map,border="grey",col=part)



