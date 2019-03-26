library(geosptdb)


### Name: rbfST
### Title: gaussian, exponential, trigonometric, thin plate spline, inverse
###   multiquadratic, and multiquadratic radial basis function for
###   spatio-temporal prediction
### Aliases: rbfST
### Keywords: spatial

### ** Examples

## Not run: 
##D # considering 10 principal coordinates (constructed from a distance-based regression model)
##D data(croatia.temp)
##D data(croatiadb)
##D 
##D # prediction case: one point
##D point <- data.frame(670863,5043464,5,170,200,15.7,3)
##D names(point) <- c("x","y","t","dem","dsea","twi","est")
##D 
##D croatia.temp[,7] <- as.factor(croatia.temp[,7])
##D dblm1 <- dblm(data=croatia.temp,y=croatiadb$MTEMP)         
##D newdata1 <- t(cp.xnews(newdata=point,eigenvalues=dblm1$ev, data=croatia.temp,trend=dblm1$cp))
##D colnames(newdata1) <- c("X1","X2","X3","X4","X5","X6","X7","X8","X9","X10")
##D newdata1 <- data.frame(point[,1:3],newdata1)
##D 
##D data(croatiadb)
##D coordinates(croatiadb) <- ~x+y
##D coordinates(newdata1) <- ~x+y
##D rbfST(MTEMP~X1+X2+X3+X4+X5+X6+X7+X8+X9+X10, data=croatiadb, eta=0.010076, rho=0.00004, 
##D        newdata=newdata1, n.neigh=60, func="TPS")
##D 
##D # prediction case: a grid of points Croatia (month july)
##D data(croatia.grid7cp)
##D coordinates(croatia.grid7cp) <- ~x+y
##D rbf.t <- rbfST(MTEMP~X1+X2+X3+X4+X5+X6+X7+X8+X9+X10, croatiadb, eta=0.01076, rho=0.00004, 
##D                 newdata=croatia.grid7cp, n.neigh=30, func="TPS")                  
##D coordinates(rbf.t) <- c("x", "y")
##D gridded(rbf.t) <- TRUE
##D 
##D # show prediction map
##D spplot(rbf.t["var1.pred"], cuts=30, col.regions=bpy.colors(40), main = "Earth's average 
##D        temperature TPS map\n (july month)", key.space=list(space="right", cex=0.8))
## End(Not run)



