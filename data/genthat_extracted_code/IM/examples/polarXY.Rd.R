library(IM)


### Name: polarXY
### Title: Calculate polar coordinates of elements in a matrix
### Aliases: polarXY polarXY-methods polarXY,matrix,numeric-method
### Keywords: utilities

### ** Examples

data(lena);
I=rowSums(img,dims=2);
center= calcCentroid(I);
result= polarXY(I, center);



