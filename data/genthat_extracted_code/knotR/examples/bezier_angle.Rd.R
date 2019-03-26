library(knotR)


### Name: bezier_angle
### Title: Intersection of two Bezier curves
### Aliases: bezier_angle bezier_intersect

### ** Examples




P1 <- matrix(c(1, 3, 6, 4, 7, 3, 2, 2),ncol=2)
P2 <- matrix(c(4, 5, 5, 3, 7, 2, 5, 1),ncol=2)

x1 <- bezier(P1,n=100)
x2 <- bezier(P2,n=100)

plot(x1,asp=1,xlim=c(0,8),ylim=c(0,8))
points(x2)

myseg(P1)
myseg(P2)

jj <- bezier_intersect(P1,P2)
points(x=jj[1],y=jj[2],pch=16,cex=3,col='blue')

# looks close to orthogonal, actually 82 degrees:
acos(sqrt(bezier_angle(P1,P2)))*180/pi 





