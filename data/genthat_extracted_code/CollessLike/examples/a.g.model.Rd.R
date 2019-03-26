library(CollessLike)


### Name: a.g.model
### Title: Generates a random tree
### Aliases: a.g.model

### ** Examples

 

# A phylogenetic tree with 10 leaves and parameters alpha=0.8 and gamma=0.1
## No test: 
tree = a.g.model(10,0.8,0.1)
## End(No test)
## No test: 
plot(tree,layout=layout.reingold.tilford(tree,root=which(degree(tree,mode="in")==0)))
## End(No test)
 



