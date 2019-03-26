library(IM)


### Name: calcMaxRadius
### Title: Compute maximum radius.
### Aliases: calcMaxRadius calcMaxRadius-methods
###   calcMaxRadius,matrix-method
### Keywords: utilities

### ** Examples

data(mandril)
I=rowSums(img,dims=2);

maxRadius= calcMaxRadius(I);
maxRadius= calcMaxRadius(I, calcCentroid(I));



