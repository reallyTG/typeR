library(mrfDepth)


### Name: depthContour
### Title: Depth contours of multivariate data
### Aliases: depthContour
### Keywords: multivariate

### ** Examples

# Compute the depth contours of a simple
# two-dimensional dataset. 
data(cardata90)
Result <- depthContour(x = cardata90,
                       alpha = c(0.125,0.25),
                       type = "hdepth")
plotContours(x = cardata90, depthContour = Result)

# One may consider different depths such as 
# e.g. projection depth by changing the type.
Result <- depthContour(x = cardata90,
                       alpha = c(0.125,0.25),
                       type = "projdepth")
plotContours(x = cardata90, depthContour = Result)
# When there is skewness in the data projection depth
# is less appropriate. 

# For projection based types the directions to 
# search intersections may be specified by the user. 
# It is advised to consider enough to directions to have
# a good image of the depth contours. 
directions <- matrix(c(0,1,
                       1,1,
                       1,0,
                       -1,-1),
                     ncol = 2, byrow = TRUE)
Result <- depthContour(x = cardata90,
                       alpha = c(0.125,0.25),
                       type = "sprojdepth",
                       directions = directions
                       )
plot <- plotContours(x = cardata90, depthContour = Result)
plot
# Note that plot seems distorted as the axis are 
# not on the same range. The returned object is a ggplot2
# object that may be edited using standard ggplot2 commands.
plot + ylab("Engine displacement") + xlab("Weight in pounds")


# Options for the underlying routine may be passed using 
# the options argument.
Result <- depthContour(x = cardata90,
                       alpha = c(0.125,0.25, 0.35),
                       type = "sprojdepth",
                       options = list(type = "Affine",
                                      seed = 123)
                      )
plotContours(x = cardata90, depthContour = Result)
# The number of steps in the bisection algorithm is
# controlled by the \code{max.iter} argument. Setting
# this too low may lead to bad approximations of the
# contour. 
Result <- depthContour(x = cardata90,
                       alpha = c(0.125,0.25, 0.35),
                       type = "sprojdepth",
                       options = list(type = "Affine",
                                      seed = 123,
                                      max.iter = 2)
                      )
plotContours(x = cardata90, depthContour = Result)
# One can check the algorithm hasn't converged on any 
# direction for contour level 0.125. 
Result[[1]]$depth
sum(Result[[1]]$converged)



