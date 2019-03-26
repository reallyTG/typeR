library(plotfunctions)


### Name: color_contour
### Title: Creates a contour plot with colored background.
### Aliases: color_contour

### ** Examples


# Volcano example of R (package datasets)
color_contour(z=volcano)
# change color and lines:
color_contour(z=volcano, color='terrain', col=alpha(1), lwd=2, lty=5)
# change x-axis values and zlim:
color_contour(x=seq(500,700, length=nrow(volcano)),
    z=volcano, color='terrain', col=alpha(1), lwd=2, zlim=c(0,200))

# compare with similar functions:
filled.contour(volcano, color.palette=terrain.colors)

# without contour lines:
color_contour(z=volcano, color='terrain', lwd=0, drawlabels=FALSE)
# without background:
color_contour(z=volcano, color=NULL, add.color.legend=FALSE)



