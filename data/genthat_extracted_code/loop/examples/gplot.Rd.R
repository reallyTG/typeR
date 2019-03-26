library(loop)


### Name: gplot
### Title: make a plot for directional graph from edge matrix graph form
### Aliases: gplot

### ** Examples

#make plots
mat<-matrix(c(1,2,1,3,2,4,3,5,4,5,6,7,8,9,1,9,9,8),nrow=9,ncol=2)
w<-c(3,10,30,50,20,22,9,15,33)
mat<-cbind(mat,w)
gplot(edgemat=mat)



