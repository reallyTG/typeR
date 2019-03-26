library(measuRing)


### Name: imageTogray
### Title: Gray matrix
### Aliases: imageTogray

### ** Examples

## (not run) Read two image sections in package measuRing:
image1 <- system.file("P105_a.tif", package="measuRing")
image2 <- system.file("P105_a.png", package="measuRing")
## (not run) compute a gray matrix:
gray <- imageTogray(image1)
## (not run) - the ppi is embedded in the image:
attributes(gray)
## (not run) but, the ppi is not embedded in image2:
## - imageTogray will return an error:
## (uncoment and run):
## gray2 <- imageTogray(image2)
## attributes(gray2)
## - the ppi should be provided (i.e. ppi = 1200):
gray3 <- imageTogray(image2,ppi = 1200)
attributes(gray3)
##(not run) a plot of the gray matrix        
xrange <- range(0:ncol(gray)) + c(-1,1)
yrange <- range(0:nrow(gray)) + c(-1,1)    
{plot(xrange,yrange,xlim=xrange,ylim=yrange,xlab='',
      ylab='',type='n',asp=0)
rasterImage(gray,xrange[1],yrange[1],xrange[2],yrange[2])}    



