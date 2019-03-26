library(IM)


### Name: plotMoment
### Title: Display a heat map of image moments
### Aliases: plotMoment plotMoment-methods plotMoment,CmplxIm-method
###   plotMoment,OrthIm-method plotMoment,MultiIm-method
### Keywords: misc hplot

### ** Examples

data(livingroom)
Obj= momentObj(img, type="gpzm", order=20, 0);
plotMoment(Obj);

## Not run: 
##D 	images= list(img,img,img,img);
##D 	Obj= momentObj(images, type="krawt", order=100, 0.5);
##D 	plotMoment(Obj);
## End(Not run)



