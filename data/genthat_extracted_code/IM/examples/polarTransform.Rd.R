library(IM)


### Name: polarTransform
### Title: Represent an image by plotting radius against angle
### Aliases: polarTransform polarTransform-methods
###   polarTransform,matrix,numeric,numeric,numeric-method
###   polarTransform,matrix,numeric-method
### Keywords: utilities

### ** Examples

data(circles);
I=rowSums(img,dims=2)
R=polarTransform(I, 6, 100);
displayImg(list(I,R[[1]]));



