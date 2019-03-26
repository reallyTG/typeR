library(EMMIXuskew)


### Name: fmmst.contour.2d
### Title: 2D and 3D Visualisation of Fitted Contours
### Aliases: fmmst.contour.2d fmmst.contour.3d
### Keywords: contour 3d

### ** Examples

#2D plots
obj <- list()
obj$mu <- list(c(17,19), c(5,22), c(6,10))
obj$sigma <- list(diag(2), matrix(c(2,0,0,1),2), matrix(c(3,7,7,24),2))
obj$delta <- list(c(3,1.5), c(5,10), c(2,0))
obj$dof <- c(1, 2, 3)
obj$pro <- c(0.25, 0.25, 0.5)
mySample <- rfmmst(3, 500,known=obj)
obj$clusters <- mySample[,3]

par(mfrow=c(2,2))
fmmst.contour.2d(mySample, model=obj, clusters=obj$clusters) 
fmmst.contour.2d(mySample[,1:2], model=obj, clusters=obj$clusters, map="heat") 
fmmst.contour.2d(mySample[,1:2], model=obj, clusters=obj$clusters, map="cluster")   
fmmst.contour.2d(mySample[,1:2], model=obj, clusters=obj$clusters, component=1)


#3D plot
## Not run: 
##D   obj <- list()
##D   obj$mu <- list(c(420,360,425), c(160,570,200), c(320,540,260), c(530,80,450))
##D   obj$sigma <- 
##D       list(matrix(c(9160,5580,7000,5580,12105,7160,7000,7160,7250),3,3),
##D       matrix(c(3870,1810,1770,1810,2900,1270,1770,1270,1320),3,3),
##D       matrix(c(1695,1190,2280,1190,2780,2010,2280,2010,3720),3,3),
##D       matrix(c(1590,590,15,590,2425,415,15,415,1870),3,3))
##D   obj$delta <- list(c(4.8,-17,-50), c(-4,-80,-60), c(-40,8,-10), c(-60,90,-6))
##D   obj$dof <- c(10,30,40,40)
##D   obj$pro <- c(0.125, 0.19, 0.135, 0.55) 
##D   mySample <- rfmmst(4, 10000, known=obj)
##D   obj$clusters <- mySample[,4]  
##D   fmmst.contour.3d(mySample[,1:3], model=obj, levels=0.95, 
##D       drawpoints=F, clusters=obj$clusters, component=1:4)
## End(Not run)



