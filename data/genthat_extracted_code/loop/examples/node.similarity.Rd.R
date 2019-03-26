library(loop)


### Name: node.similarity
### Title: calculate pair similarity of nodes based on the nodes'
###   similarity which have links with the focused pair of nodes
### Aliases: node.similarity

### ** Examples

mat=matrix(c(0,5,3,7,0,5,0,0,0,4,3,8,0,1,0,7,0,1,0,0,0,4,6,2,0),5,5)
#compare the differences for each type of links
node.similarity(gemat=mat,type="in")
node.similarity(gemat=mat,type="out")
node.similarity(gemat=mat,type="both")



