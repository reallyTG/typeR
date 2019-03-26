library(Modalclust)


### Name: contour.hmac
### Title: Plot clusters with different colors for two dimensional data
###   overlayed on the contours of the original data.
### Aliases: contour.hmac contour
### Keywords: cluster, hierarchical, nested, modal

### ** Examples

data(disc2d.hmac)
# disc2d.hmac is the output of phmac(disc2d,npart=1)

contour.hmac(disc2d.hmac,level=3,col=gray(0.7)) 

# Provide contour line at probability density 0.05.
contour(disc2d.hmac,n.cluster=2,prob=0.05) 

# Plot using smooth scatter plot.
contour.hmac(disc2d.hmac,n.cluster=2,smoothplot=TRUE) 



