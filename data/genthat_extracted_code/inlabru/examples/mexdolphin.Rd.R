library(inlabru)


### Name: mexdolphin
### Title: Pan-tropical spotted dolphins in the Gulf of Mexico.
### Aliases: mexdolphin

### ** Examples

## No test: 
 data(mexdolphin, package="inlabru")
 plot(mexdolphin$mesh,edge.color="lightgray",draw.segments=FALSE) # draw mesh
 plot(mexdolphin$ppoly,add=TRUE) # add survey region boundary
 plot(mexdolphin$samplers,col="blue",add=TRUE) # draw transects (in and out of survey region)
 grsize = attributes(mexdolphin$points)$data[,"size"] # Get group size data
 plot(mexdolphin$points,pch=19,col="red",cex=log(grsize/30),add=TRUE)
 
## End(No test)



