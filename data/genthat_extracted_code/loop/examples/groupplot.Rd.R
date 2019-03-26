library(loop)


### Name: groupplot
### Title: A group way to plot network structure based on similar vertex
###   will be grouped together, while dissimilar nodes/vertex will depart
###   from each others.
### Aliases: groupplot

### ** Examples

mat=matrix(c(0,5,3,7,0,5,0,8,0,4,3,8,0,1,6,7,0,1,0,2,0,4,6,2,0),5,5)
glist<-list(c1=c(1:5),c2=c(1,3),c3=c(3,4,5))
pch=c(21,21,21) #length of the parameter vector should be identical to the number of species groups
bg=c(1,2,3)
lcol=c(8,2,4)
groupplot(gemat=mat,groups=glist,pch=pch,lcol=lcol,bg=bg) #other parameters are set in default



