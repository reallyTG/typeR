library(RConics)


### Name: Affine planar transformations matrix
### Title: Affine planar transformation matrix
### Aliases: 'affine planar transformations matrix' reflection rotation
###   scaling translation

### ** Examples

p1 <- c(2,5,1)  # homogeneous coordinate

# rotation
r_p1 <- rotation(4.5) %*% p1

# rotation centered in (3,1)
rt_p1 <- rotation(4.5, pt=c(3,1,1)) %*% p1

# translation
t_p1 <- translation(c(2,-4)) %*% p1

# scaling
s_p1 <- scaling(c(-3,1)) %*% p1

# plot
plot(t(p1),xlab="x",ylab="y", xlim=c(-5,5),ylim=c(-5,5),asp=1)
abline(v=0,h=0, col="grey",lty=1)
abline(v=3,h=1, col="grey",lty=3)
points(3,1,pch=4)
points(t(r_p1),col="red",pch=20)
points(t(rt_p1),col="blue",pch=20)
points(t(t_p1),col="green",pch=20)
points(t(s_p1),col="black",pch=20)




