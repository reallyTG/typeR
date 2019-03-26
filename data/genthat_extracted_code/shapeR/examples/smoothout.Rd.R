library(shapeR)


### Name: smoothout
### Title: Contour smoothing
### Aliases: smoothout

### ** Examples

## Not run: 
##D data(shape)
##D shape = smoothout(shape,n=100)
##D 
##D # Plot smoothed outline on top of original outline for comparison
##D outline.org=shape@outline.list.org[["IC"]][["403_2"]]
##D outline=shape@outline.list[["IC"]][["403_2"]]
##D plot(outline.org$X,outline.org$Y,type='l',xlab="",ylab="",lwd=2,axes=F)
##D lines(outline$X,outline$Y,col="red",lwd=2)
##D legend("bottomleft",c('Original','Smoothed'),lty=1,col=c('black','red'),lwd=2)
## End(Not run)



