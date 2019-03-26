library(plotfunctions)


### Name: plot_image
### Title: Add images to plots.
### Aliases: plot_image

### ** Examples


# see Volcano example at help(image)
# create image object:
myimg <- list(image=volcano-min(volcano), col=terrain.colors(max(volcano)-min(volcano)))
# create emoty plot window:
emptyPlot(1,1, main="Volcano images")
# add image topleft corner:
plot_image(img=myimg, xrange=c(0,.25), yrange=c(.75,1), add=TRUE)
# add transparent image as overlay:
myimg$col <- alpha(myimg$col, f=.25)
plot_image(img=myimg, add=TRUE, fill.plotregion=TRUE, bty='n')
# add image:
myimg$col <- topo.colors(max(myimg$image))
plot_image(img=myimg, xrange=c(0.125,.375), yrange=c(.5,.875), add=TRUE)
# add some points and lines:
points(runif(10,0,1), runif(10,0,1), type='o')




