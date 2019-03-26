library(RConics)


### Name: conicThrough5Points
### Title: Compute the conic that passes through 5 points
### Aliases: conicThrough5Points

### ** Examples

# five points
p1 <- c(-4.13, 6.24, 1)
p2 <- c(-8.36, 1.17, 1)
p3 <- c(-2.03, -4.61, 1)
p4 <- c(9.70, -3.49, 1)
p5 <- c(8.02, 3.34, 1)

# matrix representation of the conic passing
# through the five points
C5 <- conicThrough5Points(p1,p2,p3,p4,p5)

# plot
plot(rbind(p1,p2,p3,p4,p5),xlim=c(-10,10), ylim=c(-10,10), asp=1) 
# from matrix to ellipse parameters
E5 <- conicMatrixToEllipse(C5)
lines(ellipse(E5$saxes, E5$loc, E5$theta, n=500))



