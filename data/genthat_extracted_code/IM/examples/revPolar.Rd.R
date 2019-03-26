library(IM)


### Name: revPolar
### Title: Inverse transform of the 'polarTransform' method
### Aliases: revPolar revPolar-methods revPolar,numeric,list-method
### Keywords: utilities

### ** Examples

#perform a polar transform on the original image
data(circles);
I=rowSums(img,dims=2)
R=polarTransform(I, 20, 100);
## Not run: displayImg(R[[1]]);

#now reverse the transform
IR = revPolar(dim(I),R);
## Not run: displayImg(IR);




