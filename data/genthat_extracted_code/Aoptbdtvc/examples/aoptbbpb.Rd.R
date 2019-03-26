library(Aoptbdtvc)


### Name: aoptbbpb
### Title: A-optimal balanced bipartite block designs
### Aliases: aoptbbpb
### Keywords: balanced bipartite block designs A-optimal

### ** Examples

##construct an A-optimal BBPB design with 5 test treatments and 3 control treatments in 
##12 blocks each of size 5
aoptbbpb(v1=5,v2=3,b=12,k=5)
##construct an A-optimal BBPB design with 6 test treatments and 3 control treatments in 
##6 blocks each of size 8
aoptbbpb(v1=6,v2=3,b=6,k=8)
##Design does not exist
#not run
aoptbbpb(3,2,9,3)
aoptbbpb(6,3,9,4)
#Design not found
## Not run: aoptbbpb(3,3,12,4)



