library(phytools)


### Name: pbtree
### Title: Simulate pure-birth or birth-death stochastic tree or trees
### Aliases: pbtree
### Keywords: phylogenetics simulation

### ** Examples

# simulate a pure-birth tree with 400 tips, scaled to a length of 1.0
tree<-pbtree(n=400,scale=1)
# simulate a pure-birth tree conditioning on n & t
tt<-log(50)-log(2)
tree<-pbtree(n=50,t=tt)



