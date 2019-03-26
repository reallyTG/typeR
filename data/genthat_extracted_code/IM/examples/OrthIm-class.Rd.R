library(IM)


### Name: OrthIm-class
### Title: Class for handling continuous or discrete orthogonal moments
###   analysis of an image
### Aliases: OrthIm-class Moments<-,OrthIm-method Invariant<-,OrthIm-method
###   Reconstruct<-,OrthIm-method initialize,OrthIm-method
###   momentType<-,OrthIm-method plotPoly,OrthIm,numeric-method
###   setOrder<-,OrthIm-method setParams<-,OrthIm-method
###   transform<-,OrthIm-method
### Keywords: classes

### ** Examples

data(mandril);
obj <- new("OrthIm",img = img,filename = "");
momentType(obj) = c("chebycont","legend");
setOrder(obj) = c(150,150);
Moments(obj) = NULL;
Reconstruct(obj) = c(125,125);
## Not run: 
##D 	displayImg(list(obj@I,obj@moments,obj@reconstruction));
##D 	plotPoly(obj,order=c(100,150));
## End(Not run)



