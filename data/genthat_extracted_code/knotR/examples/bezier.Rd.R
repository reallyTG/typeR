library(knotR)


### Name: bezier
### Title: Various functionality for Bezier curves
### Aliases: bezier bezier_deriv bezier_deriv2 bezier_length bezier_radius
###   bezier_curvature myseg

### ** Examples



P <- matrix(c(0, 1, 2, 2, 2, 0, 3, 2),4,2)
xy <- bezier(P,n=100)
dx <- bezier_deriv(P,n=100)

plot(xy,asp=1)
myseg(P)

plot(xy,asp=1,cex=sqrt(rowSums(dx^2))/3.2)

plot(xy,asp=1)
segments(xy[,1],xy[,2],(xy+dx/200)[,1],(xy+dx/200)[,2])


plot(xy, asp=1,cex=bezier_radius(P,n=100)/2)

lapply(as.controlpoints(k8_9),bezier_radius)
lapply(as.controlpoints(k8_9),bezier_arclength)




