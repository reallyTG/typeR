library(loop)


### Name: fplot.foodweb
### Title: a special group graph plot function for food web-style
###   hierarchical structure
### Aliases: fplot.foodweb

### ** Examples

mat=matrix(c(0,5,3,7,0,5,0,8,0,4,3,8,0,1,6,7,0,1,0,2,0,4,6,2,0),5,5)
rlist<-list(c1=c(1,2),c2=c(3,4),c3=5)
#other parameters are set in default
fplot.foodweb(gemat=mat,ranks=rlist)
#change some parameters
fplot.foodweb(gemat=mat,ranks=rlist,lcol=3,pch=21,
bg="white",addlabels=TRUE,tfont=5)



