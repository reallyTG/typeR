library(loop)


### Name: rank.nodes
### Title: rank nodes based on the inward links/outward links/both links
### Aliases: rank.nodes

### ** Examples

mat=matrix(c(0,5,3,7,0,5,0,8,0,4,3,8,0,1,6,7,0,1,0,2,0,4,6,2,0),5,5)
rank.nodes(gemat=mat,type="in")
rank.nodes(gemat=mat,type="out")
rank.nodes(gemat=mat,type="both")



