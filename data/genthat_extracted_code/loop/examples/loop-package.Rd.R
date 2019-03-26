library(loop)


### Name: loop-package
### Title: an R package for analyzing and plotting directed networks
### Aliases: loop-package loop

### ** Examples

gemat=matrix(c(13,26,0,11,18,15,15,0,2),nrow=3,ncol=3)
gemat=matrix(c(13,26,0,12,18,15,15,0,2),nrow=3,ncol=3)
#search out all loops
decomp(gemat)
#make plots
mat<-matrix(c(1,2,1,3,2,4,3,5,4,5,6,7,8,9,1,9,9,8),nrow=9,ncol=2)
w<-c(3,10,30,50,20,22,9,15,33)
mat<-cbind(mat,w)
gplot(mat)




