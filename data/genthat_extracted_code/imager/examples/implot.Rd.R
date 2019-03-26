library(imager)


### Name: implot
### Title: Plot objects on image using base graphics
### Aliases: implot

### ** Examples

b.new <- implot(boats,text(150,50,"Boats!!!",cex=3))
plot(b.new)
#Draw a line on a white background
bg <- imfill(150,150,val=1)
implot(bg,lines(c(50,50),c(50,100),col="red",lwd=4))%>%plot
#You can change the rendering of the initial image
im <- grayscale(boats)
draw.fun <- function() text(150,50,"Boats!!!",cex=3)
out <- implot(im,draw.fun(),colorscale=function(v) rgb(0,v,v),rescale=FALSE)
plot(out)



