library(IM)


### Name: momentObj
### Title: Calculate moments of image
### Aliases: momentObj momentObj-methods
###   momentObj,list,character,Numbers-method
###   momentObj,Numbers,character,Numbers-method
### Keywords: misc

### ** Examples

#compute chebyshev moments of an image 
data(lena)
## Not run: displayImg(obj@I)
obj = momentObj(I=img,type="cheby",order=c(500,500));
## Not run: plotMoment(obj)
#reconstruct the image from the moments
Reconstruct(obj) = c(200,200);
## Not run: displayImg(obj@reconstruction)


## Not run: 
##D 	#calculate bivariate Legendre/Gegenbauer moments up to orders 50 and 100 with parameter 1 for Gegenbauer moments.
##D 	data(lena);
##D 	displayImg(obj@I);
##D 	obj= momentObj(img,c("legend", "gegen"),c(200, 300),NULL,2);
##D 	plotMoment(obj);
##D 	#reconstruct the image from all the moments
##D 	Reconstruct(obj) = NULL;
##D 	displayImg(obj@reconstruction);
## End(Not run)


## Not run: 
##D 	#compute Radial Harmonic-Fourier moment invariants of a list of images, using up to order 10 and repetition 10
##D 	data(bacteria);
##D 	obj= momentObj(I=img[1:10],type="fr",order=c(10,10));  
##D 	Invariant(obj) = NULL;
## End(Not run)



