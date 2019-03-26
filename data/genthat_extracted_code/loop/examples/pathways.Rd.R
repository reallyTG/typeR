library(loop)


### Name: pathways
### Title: enumerate all food chains that are linked to a given
###   species/node
### Aliases: pathways

### ** Examples

mat=matrix(c(0,5,3,7,0,5,0,8,0,4,3,8,0,1,6,7,0,1,0,2,0,4,6,2,0),5,5)
pathways(mat,bsp=2)
#a vector of species
pathways(mat,bsp=c(1,3,5))



