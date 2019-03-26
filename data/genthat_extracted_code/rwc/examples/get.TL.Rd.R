library(rwc)


### Name: get.TL
### Title: Construct a transition list from a raster or raster stack
### Aliases: get.TL
### Keywords: ~kwd1 ~kwd2

### ** Examples

int=raster(nrow=30,ncol=30)
values(int)=1
TL.int=get.TL(int)
Q.int=get.Q(TL.int,1)
image(Q.int)



