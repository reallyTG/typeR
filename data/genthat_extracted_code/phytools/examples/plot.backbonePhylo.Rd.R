library(phytools)


### Name: plot.backbonePhylo
### Title: Plots backbone tree with triangles as clades
### Aliases: plot.backbonePhylo
### Keywords: phylogenetics plotting

### ** Examples

## first create our backbone tree with
## random subtree diversities
tree<-phytools:::lambdaTree(pbtree(n=10),lambda=0.5)
## create a translation table
## leaving a couple of single-taxon clades for fun
tip.label<-sample(tree$tip.label,8)
clade.label<-LETTERS[1:8]
N<-ceiling(runif(n=8,min=1,max=20))
## set crown node depth to 1/2 the maximum depth
depth<-sapply(tip.label,function(x,y) 
	0.5*y$edge.length[which(tree$edge[,2]==
	which(y$tip.label==x))],y=tree)
trans<-data.frame(tip.label,clade.label,N,depth)
rownames(trans)<-NULL
rm(tip.label,clade.label,N,depth)
## here's what trans looks like
trans
## convert
obj<-phylo.toBackbone(tree,trans)
## plot
plot(obj)



