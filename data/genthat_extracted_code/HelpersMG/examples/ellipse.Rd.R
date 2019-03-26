library(HelpersMG)


### Name: ellipse
### Title: Plot an ellipse
### Aliases: ellipse

### ** Examples

plot(0:1, 0:1, xlim=c(0, 1), ylim=c(0,1), lty=2, type="l", las=1, bty="n", 
     xlab="Variable x", ylab="variable y")
 
ellipse(center.x = c(0.2, 0.3, 0.25), center.y = c(0.7, 0.6, 0.55), 
        radius.x = c(0.1, 0.1, 0.1), radius.y = c(0.15, 0.2, 0.4), 
        border=NA, col=rgb(red = 0.1, green = 0.1, blue = 0.1, alpha = 0.1))

ellipse(center.x = 0.5, center.y = 0.5, 
        radius.x.lower = 0.1, radius.x.upper = 0.3, 
        radius.y = 0.2, 
        border=NA, col=rgb(red = 0.1, green = 0.1, blue = 0.1, alpha = 0.1))

ellipse(center.x = 0.6, center.y = 0.3, 
        radius.x.lower = 0.3, radius.x.upper = 0.3, 
        radius.y.lower = 0.2, radius.y.upper = 0.4, 
        border=NA, col=rgb(red = 0.1, green = 0.1, blue = 0.1, alpha = 0.1))

plot(0:1, 0:1, xlim=c(0, 1), ylim=c(0,1), lty=2, type="l", bty="n", asp=1, 
     xlab="Variable x", ylab="variable y", axes=FALSE)
axis(1, at=c(0, 0.25, 0.5, 0.75, 1))
axis(2, at=c(0, 0.25, 0.5, 0.75, 1), las=1)

ellipse(center.x = 0.5, center.y = 0.5, radius.x = 0.2, radius.y = 0.4, 
       border=NA, col=rgb(red = 0.1, green = 0.1, blue = 0.1, alpha = 0.1))
ellipse(center.x = 0.5, center.y = 0.5, radius.x = 0.2, radius.y = 0.4, 
        border=NA, col=rgb(red = 0.1, green = 0.1, blue = 0.1, alpha = 0.1), alpha = pi/4)

plot(0:1, 0:1, xlim=c(0, 1), ylim=c(0,1), lty=2, type="l", las=1, bty="n", 
     xlab="Variable x", ylab="variable y")

for (k in 0:8)
  ellipse(center.x=0.5, center.y=0.5, radius.x=0.1, radius.y=0.4, 
          alpha=seq(from=0, to=pi/4, length=9)[k], 
          border=rainbow(9)[k])

# Exemple with confidence of proportions
males <- c(10, 25, 3, 4)
N <- c(12, 52, 17, 10)

males2 <- c(12, 20, 3, 6)
N2 <- c(15, 50, 20, 12)

plot(0:1, 0:1, xlim=c(0, 1), ylim=c(0,1), lty=2, type="l", las=1, bty="n", 
     xlab="Variable x", ylab="variable y")

ellipse(binconf.x = data.frame(x=males, n=N), binconf.y = data.frame(x=males2, n=N2),  
        border=NA, col=rgb(red = 0.1, green = 0.5, blue = 0.1, alpha = 0.1))
        
plot(0:1, 0:1, xlim=c(0, 1), ylim=c(0,1), lty=2, type="l", las=1, bty="n", 
     xlab="Variable x", ylab="variable y")
     
ellipse(binconf.x = data.frame(x=males, n=N), 
        binconf.y = data.frame(PointEst=c(0.1, 0.2, 0.3, 0.5), 
                               Lower=c(0.02, 0.12, 0.25, 0.30), 
                               Upper=c(0.18, 0.29, 0.35, 0.67)), 
        border=NA, col=rgb(red = 0.1, green = 0.5, blue = 0.1, alpha = 0.1))
        
# Examples with a gradient
plot(0:1, 0:1, xlim=c(0, 1), ylim=c(0,1), lty=2, type="l", las=1, bty="n", 
     xlab="Variable x", ylab="variable y")
ellipse(center.x = 0.6, center.y = 0.3, 
        radius.x.lower = 0.3, radius.x.upper = 0.3, 
        radius.y.lower = 0.2, radius.y.upper = 0.4, 
        border=NA, col=grey.colors(100, alpha = 0.1))
        
plot(0:1, 0:1, xlim=c(0, 1), ylim=c(0,1), lty=2, type="l", las=1, bty="n", 
     xlab="Variable x", ylab="variable y")
ellipse(binconf.x = data.frame(x=males, n=N), binconf.y = data.frame(x=males2, n=N2),  
        border=NA, col=grey.colors(100, alpha = 0.1))




