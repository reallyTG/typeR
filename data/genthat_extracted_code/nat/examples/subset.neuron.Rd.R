library(nat)


### Name: subset.neuron
### Title: Subset neuron by keeping only vertices that match given
###   conditions
### Aliases: subset.neuron

### ** Examples

n=Cell07PNs[[1]]
# keep vertices if their X location is > 2000
n1=subset(n, X>200)
# diameter of neurite >1 
n2=subset(n, W>1)
# first 50 nodes
n3=subset(n, 1:50)
# everything but first 50 nodes
n4=subset(n, 1:50, invert=TRUE)

## subset neuron by graph structure
# first plot neuron and show the point that we will use to divide the neuron
n=Cell07PNs[[1]]
plot(n)
# this neuron has a tag defining a point at which the neuron enters a brain
# region (AxonLHEP = Axon Lateral Horn Entry Point)
points(t(xyzmatrix(n)[n$AxonLHEP, 1:2]), pch=19, cex=2.5)

# now find the points downstream (distal) of that with respect to the root
ng=as.ngraph(n)
# use a depth first search 
distal_points=igraph::graph.dfs(ng, root=n$AxonLHEP, unreachable=FALSE, 
  neimode='out')$order
distal_tree=subset(n, distal_points)
plot(distal_tree, add=TRUE, col='red', lwd=2)

# Find proximal tree as well
# nb this does not include the AxonLHEP itself as defined here
proximal_points=setdiff(igraph::V(ng), distal_points)
proximal_tree=subset(n, proximal_points)
plot(proximal_tree, add=TRUE, col='blue', lwd=2)

## Not run: 
##D ## subset using interactively defined spatial regions
##D plot3d(n)
##D # nb you can save this select3d object using save or saveRDS functions
##D # for future non-interactive use
##D s3d=select3d()
##D n4=subset(n, s3d(xyzmatrix(n)))
##D # special case of previous version
##D n5=subset(n, s3d)
##D stopifnot(all.equal(n4,n5))
##D # keep the points that were removed from n1
##D n4.not=subset(n,Negate(s3d))
##D # vertices with x position > 100 and inside the selector function
##D n6=subset(n,X>100 & s3d(X,Y,Z))
##D 
##D ## subset each neuron object in a whole neuronlist
##D n10=Cell07PNs[1:10]
##D plot3d(n10, lwd=0.5, col='grey')
##D n10.crop = nlapply(n10, subset, X>250)
##D plot3d(n10.crop, col='red')
##D 
##D ## subset a neuron using a surface
##D library(nat.flybrains)
##D # extract left lateral horn surface and convert to mesh3d 
##D lh=as.mesh3d(subset(IS2NP.surf, "LH_L"))
##D # subset neuron with this surface
##D x=subset(Cell07PNs[[1]], function(x) pointsinside(x, lh))
##D shade3d(lh, alpha=0.3)
##D plot3d(x, lwd=3, col='blue')
##D # Now find the parts of the neuron outside the surface
##D y=subset(Cell07PNs[[1]], function(x) Negate(pointsinside)(x, lh))
##D plot3d(y, col='red', lwd=2)
## End(Not run)



