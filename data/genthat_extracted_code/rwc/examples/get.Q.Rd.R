library(rwc)


### Name: get.Q
### Title: Create a precision matrix from a transition list and a set of
###   log-conductance rates.
### Aliases: get.Q
### Keywords: ~kwd1 ~kwd2

### ** Examples

int=raster(nrow=30,ncol=30)
values(int)=1
B.int=get.TL(int)
Q.int=get.Q(B.int,1)



