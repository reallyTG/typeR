library(geospt)


### Name: rbf
### Title: gaussian, exponential, trigonometric, thin plate spline, inverse
###   multiquadratic, and multiquadratic radial basis function prediction
### Aliases: rbf
### Keywords: spatial

### ** Examples

data(preci)
coordinates(preci) <- ~x+y

# prediction case: one point
point <- data.frame(3,4)
names(point) <- c("x","y")
coordinates(point) <- ~x+y
rbf(prec~x+y, preci, eta=0.1460814, rho=0, newdata=point,n.neigh=10, func="TPS")

# prediction case: a grid of points
puntos<-expand.grid(x=seq(min(preci$x),max(preci$x),0.05), y=seq(min(preci$y),
max(preci$y),0.05))
coordinates(puntos) <- ~x+y
pred.rbf <- rbf(prec~x+y, preci, eta=0.1460814, rho=0, newdata=puntos, n.neigh=10, func="TPS")
coordinates(pred.rbf) = c("x", "y")
gridded(pred.rbf) <- TRUE

# show prediction map
spplot(pred.rbf["var1.pred"], cuts=40, col.regions=bpy.colors(100),
main = "rainfall map TPS", key.space=list(space="right", cex=0.8))



