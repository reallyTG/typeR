library(nat)


### Name: neuron
### Title: neuron: class to represent traced neurons
### Aliases: neuron is.neuron as.neuron as.neuron.data.frame
###   as.neuron.ngraph as.neuron.igraph as.neuron.default

### ** Examples

## See help for functions listed in See Also for more detailed examples
## Basic properties
# a sample neuron 
n = Cell07PNs[[1]]
# inspect its internal structure
str(n)
# summary of 3D points
summary(xyzmatrix(n))
# identify 3d location of endpoints
xyzmatrix(n)[endpoints(n),]

## Other methods
# plot
plot(n)
# all methods for neuron objects
methods(class = 'neuron')

## Neurons as graphs 
# convert to graph and find longest paths by number of nodes
ng=as.ngraph(n)
hist(igraph::distances(ng))
# ... or in distances  microns
ngw=as.ngraph(n, weights=TRUE)
hist(igraph::distances(ngw))

# converting back and forth between neurons and graphs
g=as.ngraph(Cell07PNs[[1]])
gstem=igraph::induced.subgraph(g, 1:10)
# this is fine
plot(gstem)
plot(as.neuron(gstem))

# but if you had an undirected graph 
ug=igraph::as.undirected(gstem)
# you get a warning because there is no explicit origin for the graph
as.neuron(ug)

# If you need finer control of the conversion process 
gstem2=as.ngraph(ug, root = 10)
plot(gstem2)
plot(as.neuron(gstem2))



