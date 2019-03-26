library(rwc)


### Name: get.Phi
### Title: Compute the precision matrix Phi of observed nodes on a graph.
### Aliases: get.Phi
### Keywords: ~kwd1 ~kwd2

### ** Examples

int=raster(nrow=30,ncol=30)
values(int)=1
TL.int=get.TL(int)
Q.int=get.Q(TL.int,1)
## get precision matrix of only the first 5 nodes
get.Phi(Q.int,1:5)



