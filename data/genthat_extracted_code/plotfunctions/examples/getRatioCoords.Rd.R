library(plotfunctions)


### Name: getRatioCoords
### Title: Move a vector n elements forward or backward.
### Aliases: getRatioCoords

### ** Examples

data(img)
emptyPlot(100, c(50, 100), h0=0, v0=0)
# calculate height : width ratio of image:
im.r <- dim(img$image)[1]/dim(img$image)[2]
p <- getRatioCoords(ratio=im.r, width=20)
# inspect p:
p
# No position specified, so centered:
plot_image(img, type="image", add=TRUE,
    xrange=p$x, yrange=p$y)
# ... or we could provide a position:
p <- getRatioCoords(ratio=im.r, width=20,
    xleft=20, ybottom=60)
plot_image(img, type="image", add=TRUE,
    xrange=p$x, yrange=p$y)

# Using proportions of plot region:
p <- getRatioCoords(ratio=im.r, height=.5,
    xleft=0, ytop=1, input="prop")
plot_image(img, type="image", add=TRUE,
    xrange=p$x, yrange=p$y)

# Changing the ratio to square:
p <- getRatioCoords(ratio=1, height=.5,
    xright=1, ybottom=0, input="prop")
plot_image(img, type="image", add=TRUE,
    xrange=p$x, yrange=p$y)
# ... and to a long rectangle:
p <- getRatioCoords(ratio=.5, height=1,
    xright=1, ybottom=0, input="prop")
plot_image(img, type="image", add=TRUE,
    xrange=p$x, yrange=p$y, 
    replace.colors=list("#B.+"="#FF000033"),
    border='red')




