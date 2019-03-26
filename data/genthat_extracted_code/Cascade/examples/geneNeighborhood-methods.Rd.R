library(Cascade)


### Name: geneNeighborhood
### Title: Find the neighborhood of a set of nodes.
### Aliases: geneNeighborhood geneNeighborhood-methods
###   geneNeighborhood,network-method
### Keywords: methods

### ** Examples

data(Selection)
data(network)
#A nv value can chosen using the cutoff function
nv=.11 
EGR1<-which(match(Selection@name,"EGR1")==1)
P<-position(network,nv=nv)

geneNeighborhood(network,targets=EGR1,nv=nv,ini=P,
label_v=network@name)



