library(IM)


### Name: MultiIm-class
### Title: MultiIm Class
### Aliases: MultiIm-class initialize,MultiIm-method
###   checkSize<-,MultiIm-method momentType<-,MultiIm-method
###   setOrder<-,MultiIm-method setParams<-,MultiIm-method
###   Moments<-,MultiIm-method Invariant<-,MultiIm-method
###   plotPoly,MultiIm,Numbers-method Reconstruct<-,MultiIm-method
###   setPoly<-,MultiIm-method transform<-,MultiIm-method
### Keywords: classes

### ** Examples


# Load sample data
data(bacteria);

#create MultiIm object, calculate generalized Pseudo-Zernike moments, invariants, and reconstruction for all images
obj <- new("MultiIm", img);
momentType(obj)= c("gpzm");
setOrder(obj)= 20;
setParams(obj)= 1;	# <--- GPZM has 1 parameter
obj@storePoly= TRUE;

## Not run: 
##D 	Moments(obj)= NULL;
##D 	Invariant(obj)= NULL;
##D 	Reconstruct(obj)= NULL;
##D 	#display a subset of polynomials stored in the object
##D 	plotPoly(obj, order=rbind(c(3,2), c(4,2), c(5,3), c(6,3)));
##D 	displayImg(obj@reconstruction[1:5]);
## End(Not run)

## Not run: 
##D 	#create MultiIm object, calculate discrete Chebyshev moments, invariants, and reconstruction for all images
##D 	obj <- new("MultiIm", img);
##D 	momentType(obj)= "cheby"
##D 	setOrder(obj)= 100;
##D 	Moments(obj)= 0;
##D 	Reconstruct(obj)= 75;
##D 	Invariant(obj)= c(7,100); # resolution is 7, scale is 100
##D 	displayImg(obj@reconstruction[1:4]);
## End(Not run)

## Not run: 
##D 	#create MultiIm object, calculate continuous Chebyshev - Legendre moments, invariants, and reconstruction for all images
##D 	obj <- new("MultiIm", img);
##D 	momentType(obj)= c("chebycont", "legend");
##D 	setOrder(obj)= c(100, 110);	
##D 	transform(obj)= 8; 	# perform polar transform on images
##D 	Moments(obj)= 0;
##D 	Reconstruct(obj)= NULL;
##D 
##D 	# order of pairs (20,10), (21, 11),...(28,18) will be plotted
##D 	plotPoly(obj, order=cbind(20:28, 10:18));
##D 	displayImg(obj@reconstruction[1:6]);
## End(Not run)



