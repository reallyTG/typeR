library(loop)


### Name: find.ranks
### Title: make food trophic ranks for all the species in the matrix for
###   fplot.foodweb function
### Aliases: find.ranks

### ** Examples

gemat<-matrix(c(0,5,3,7,0,5,0,8,0,4,3,8,0,1,6,7,0,1,0,2,0,4,6,2,0),5,5)
ranks<-find.ranks(gemat)
fplot.foodweb(gemat=gemat,ranks=ranks,addlabels=TRUE,bg="white",pch=21,pcex=4,lcol=2,weighted=FALSE)



