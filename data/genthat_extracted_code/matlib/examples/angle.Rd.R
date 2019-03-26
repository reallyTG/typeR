library(matlib)


### Name: angle
### Title: Angle between two vectors
### Aliases: angle

### ** Examples

x <- c(2,1)
y <- c(1,1)
angle(x, y) # degrees
angle(x, y, degree = FALSE) # radians

# visually
xlim <- c(0,2.5)
ylim <- c(0,2)
# proper geometry requires asp=1
plot( xlim, ylim, type="n", xlab="X", ylab="Y", asp=1,
  main = expression(theta == 18.4))
abline(v=0, h=0, col="gray")
vectors(rbind(x,y), col=c("red", "blue"), cex.lab=c(2, 2)) 
text(.5, .37, expression(theta))


####
x <- c(-2,1)
y <- c(1,1)
angle(x, y) # degrees
angle(x, y, degree = FALSE) # radians

# visually
xlim <- c(-2,1.5)
ylim <- c(0,2)
# proper geometry requires asp=1
plot( xlim, ylim, type="n", xlab="X", ylab="Y", asp=1,
  main = expression(theta == 108.4))
abline(v=0, h=0, col="gray")
vectors(rbind(x,y), col=c("red", "blue"), cex.lab=c(2, 2)) 
text(0, .4, expression(theta), cex=1.5)



