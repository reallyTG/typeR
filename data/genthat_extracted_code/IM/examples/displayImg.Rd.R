library(IM)


### Name: displayImg
### Title: Display an image in grayscale
### Aliases: displayImg displayImg-methods displayImg,Numbers-method
###   displayImg,list-method
### Keywords: misc

### ** Examples

#### display the original image in a "OrthIm" object.
data(pirate);

#create OrthIm object from image
obj <- new("OrthIm",img = img,filename = "");
momentType(obj) = "cheby";
setOrder(obj) = c(200,200);

#display original image
displayImg(obj@I);

## Not run: 
##D 	#analyze image
##D 	Moments(obj) = 0;
##D 	Reconstruct(obj) = NULL;
##D 	
##D 	#display reconstructed image
##D 	displayImg(obj@reconstruction)
## End(Not run)


## Not run: 
##D 	#### display a list of images from a "MultiIm" object.
##D 	data(characters)
##D 	#take a small subset
##D 	img = img[1:5];
##D 	#analyze images
##D 	obj= momentObj(I=img, type = "cheby", order = c(dim(img[[1]])[2],dim(img[[1]])[1]) );
##D 	Reconstruct(obj)= NULL;
##D 	
##D 	#display original images
##D 	displayImg(obj@imageList);
##D 	
##D 	#display reconstructed images
##D 	displayImg(obj@reconstruction);
## End(Not run)



