library(lava)


### Name: images
### Title: Organize several image calls (for visualizing categorical data)
### Aliases: images

### ** Examples

X <- matrix(rbinom(400,3,0.5),20)
group <- rep(1:4,each=5)
images(X,colorbar=0,zlim=c(0,3))
images(X,group=group,zlim=c(0,3))
## Not run: 
##D images(X,group=group,col=list(RColorBrewer::brewer.pal(4,"Purples"),
##D                                RColorBrewer::brewer.pal(4,"Greys"),
##D                                RColorBrewer::brewer.pal(4,"YlGn"),
##D                                RColorBrewer::brewer.pal(4,"PuBuGn")),colorbar=2,zlim=c(0,3))
## End(Not run)
images(list(X,X,X,X),group=group,zlim=c(0,3))
images(list(X,X,X,X),ncol=1,group=group,zlim=c(0,3))
images(list(X,X),group,axis2=c(FALSE,FALSE),axis1=c(FALSE,FALSE),
      mar=list(c(0,0,0,0),c(0,0,0,0)),yaxs="i",xaxs="i",zlim=c(0,3))



