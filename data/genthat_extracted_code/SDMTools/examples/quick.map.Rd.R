library(SDMTools)


### Name: quick.map
### Title: Quick Map
### Aliases: quick.map

### ** Examples

#create a matrix
tmat = { matrix(c( 0,0,0,1,0,0,1,1,0,1,
                   0,0,1,0,1,0,0,0,0,0,
                   0,1,NA,1,0,1,0,0,0,1,
                   1,0,1,1,1,0,1,0,0,1,
                   0,1,0,1,0,1,0,0,0,1,
                   0,0,1,0,1,0,0,1,1,0,
                   1,0,0,1,0,0,1,0,0,0,
                   0,1,0,0,0,1,0,0,0,1,
                   0,0,1,1,1,0,0,1,1,1,
                   1,1,1,0,0,0,0,1,1,1),nr=10,byrow=TRUE) }

#do the connected component labeling
tasc = ConnCompLabel(tmat)

#put in the gradient scale
pnts = cbind(x =c(1.1,1.2,1.2,1.1), y =c(0.9,0.9,0.7,0.7))

# Set the map and gradient leyend colors
tasc.col=colorRampPalette(c("yellow","orange", "red"))(5)

#Create an image with the gradient legend
quick.map(tasc,0.09,bkgd.col = 'darkgrey', cols=tasc.col,
    axes=FALSE, xlim=c(0.0,1.35))

#########################
# Create an image with two colors: below the threshold and
# above the threshold

# The next version of SDM Tools will let you create the legend.gradient
# at a specific side of your image, and the user would not need to set
# the coordinates.

# To create the legend.gradient at the bottom left of your image without
# setting up the coordinates at the image you can do this:

xlim = c(-0.5,1)
ylim = c(0,1)
wid = diff(xlim)*0.05
ht = diff(ylim)*0.1
xvals = c(xlim[1]+wid,xlim[1]+2*wid,xlim[1]+2*wid,xlim[1]+wid)
yvals = c(ylim[1]+ht,ylim[1]+ht,ylim[1]+2*ht,ylim[1]+2*ht)

#Create the points for the legend.gradient
pnts=(cbind(xvals,yvals))

# Set the images colors: above the threshold is black and
# below the threshold is darkgrey.
quick.map(tasc,0.09,bkgd.col = 'darkgrey', cols="black",
    axes=FALSE, xlim=c(-0.8, 1))



