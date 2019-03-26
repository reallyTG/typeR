library(loop)


### Name: groupplot.foodweb
### Title: a special group graph plot function for food web-style
###   hierarchical structure
### Aliases: groupplot.foodweb

### ** Examples

mat=matrix(c(0,5,3,7,0,5,0,8,0,4,3,8,0,1,6,7,0,1,0,2,0,4,6,2,0),5,5)
rlist<-list(c1=c(1,2),c2=c(3,4),c3=5)
glist<-list(c1=c(1:5),c2=c(1,2,3),c3=c(2,4,5))
groupplot.foodweb(gemat=mat,ranks=rlist,groups=glist) #other parameters are set in default
#when not setting other parameters, the groupplot result is identical to fplot
#because the function found that the parameters (especially the colors) are not set
#another example that can separate the groups
rlist<-list(c1=c(1,2),c2=c(3,4),c3=5)
glist<-list(c1=c(1:5),c2=c(1,3),c3=c(3,4,5))
pch=c(20,22,24) #length of the parameter vector should be identical to the number of species groups
lcol=c(8,2,4)
groupplot.foodweb(gemat=mat,ranks=rlist,groups=glist,pch=pch,lcol=lcol) #other parameters are set in default



