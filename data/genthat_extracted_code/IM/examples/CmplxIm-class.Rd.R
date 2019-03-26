library(IM)


### Name: CmplxIm-class
### Title: CmplxIm Class
### Aliases: CmplxIm-class Moments<-,CmplxIm-method
###   Invariant<-,CmplxIm-method Reconstruct<-,CmplxIm-method
###   initialize,CmplxIm-method momentType<-,CmplxIm-method
###   setImage<-,CmplxIm-method setOrder<-,CmplxIm-method
###   setParams<-,CmplxIm-method setPolar<-,CmplxIm-method
### Keywords: classes

### ** Examples




#load image
data(earth)
#initialize object
obj<- new("CmplxIm", img=img)
## Not run: displayImg(obj@I)
#set the moment type to generalized Pseudo-Zernike
momentType(obj)<- "gpzm"
#set the order
setOrder(obj)<- 25
#set the parameter  
setParams(obj)<- 1

## Not run: 
##D 	#calculate moments of the image
##D 	Moments(obj)<- NULL
##D 	#calculate rotation invariants
##D 	Invariant(obj) =NULL;
##D 	#reconstruct the image from moments
##D 	Reconstruct(obj)<- c(20,20)
## End(Not run)
## Not run: plotMoment(obj);
## Not run: displayImg(obj@reconstruction);



