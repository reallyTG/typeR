library(svdvisual)


### Name: svd3dplot
### Title: The SVD three dimensional plots: surface plot and/or image plot
###   for SVD decomposition
### Aliases: svd3dplot
### Keywords: svd visualization

### ** Examples

#generate a random sample
#generate a random matrix
x<-matrix(rnorm(100), nrow=20);

#generate a surface plot
svd3dplot(x);

#generate an image plot
svd3dplot(x, iimage=TRUE);



