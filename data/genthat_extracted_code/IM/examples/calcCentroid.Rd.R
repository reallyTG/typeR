library(IM)


### Name: calcCentroid
### Title: Calculate the centroid of a grayscale image
### Aliases: calcCentroid calcCentroid-methods calcCentroid,matrix-method
### Keywords: multivariate utilities

### ** Examples

data(pirate)
I=rowSums(img,dims=2);
center= calcCentroid(I);



