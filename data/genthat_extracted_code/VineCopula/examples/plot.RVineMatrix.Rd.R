library(VineCopula)


### Name: contour.RVineMatrix
### Title: Plotting 'RVineMatrix' objects.
### Aliases: contour.RVineMatrix plot.RVineMatrix
### Keywords: plot

### ** Examples


## build vine model
strucmat <- matrix(c(3,   1, 2, 0, 2, 1, 0, 0, 1), 3, 3)
fammat   <- matrix(c(0,   1, 6, 0, 0, 3, 0, 0, 0), 3, 3)
parmat   <- matrix(c(0, 0.3, 3, 0, 0, 1, 0, 0, 0), 3, 3)
par2mat  <- matrix(c(0,   0, 0, 0, 0, 0, 0, 0, 0), 3, 3)
RVM  <- RVineMatrix(strucmat, fammat, parmat, par2mat)

# plot trees
## Not run: plot(RVM)

# show contour plots
contour(RVM)




