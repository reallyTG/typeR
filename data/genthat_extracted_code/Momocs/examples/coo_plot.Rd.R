library(Momocs)


### Name: coo_plot
### Title: Plots a single shape
### Aliases: coo_plot coo_plot.default ldk_plot

### ** Examples

b <- bot[1]
coo_plot(b)
coo_plot(bot[2], plot.new=FALSE) # equivalent to coo_draw(bot[2])
coo_plot(b, zoom=2)
coo_plot(b, border='blue')
coo_plot(b, first.point=FALSE, centroid=FALSE)
coo_plot(b, points=TRUE, pch=20)
coo_plot(b, xy.axis=FALSE, lwd=2, col='#F2F2F2')



