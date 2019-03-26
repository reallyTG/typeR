library(EMMIXcskew)


### Name: fmcfust.contour.2d
### Title: 2D and 3D Visualisation of Fitted Contours
### Aliases: fmcfust.contour.2d fmcfust.contour.3d
### Keywords: contour 3d

### ** Examples
          
## No test: 
#2D plots
data(iris)
iris.versicolor <- iris[iris$Species=="versicolor",2:3]
Fit.versicolor <- fmcfust(1, iris.versicolor)
fmcfust.contour.2d(iris.versicolor, Fit.versicolor, drawpoints=FALSE, main="versicolor")

#3D plot
obj <- list()
obj$mu <- list(matrix(c(0,0,0),3), matrix(c(5,5,5),3))
obj$sigma <- list(matrix(c(5,2,1,2,5,1,1,1,1),3,3), 2*diag(3))
obj$delta <- list(matrix(c(1,0,0,1,0,0,1,0,0),3,3), matrix(c(5,0,0,0,10,0,0,0,15),3,3))
obj$dof <- c(3,3)
obj$pro <- c(0.2, 0.8)
fmcfust.contour.3d(model=obj, level=0.98, drawpoints=FALSE, xlab="X", ylab="Y", zlab="Z", 
    xlim = c(-20, 50), ylim = c(-20, 50), zlim = c(-20, 80), ccol = "green")
## End(No test)



