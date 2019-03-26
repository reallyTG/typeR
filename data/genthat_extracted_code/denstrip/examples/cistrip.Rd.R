library(denstrip)


### Name: cistrip
### Title: Line drawings of point and interval estimates
### Aliases: cistrip panel.cistrip
### Keywords: aplot

### ** Examples

## One estimate 
x <- c(0.1, -2, 2)
plot(0, type="n", xlim=c(-5, 5), ylim=c(-5, 5), xlab="", ylab="")
abline(h=0, lty=2, col="lightgray")
abline(v=0, lty=2, col="lightgray")
cistrip(x, at=-0.1)
cistrip(x, at=0.2, lwd=3, d=0.1)
cistrip(x, at=-4, horiz=FALSE, lwd=3, d=0.2)

## Double / triple the area of the central point, as in forest plots
cistrip(x, at=2, d=0.2, pch=22, bg="black")
cistrip(x, at=2.5, d=0.2, pch=22, bg="black", cex=sqrt(2))
cistrip(x, at=3, d=0.2, pch=22, bg="black", cex=sqrt(3))

## Several estimates
x <- rbind(c(0.1, -2, 2), c(1, -1, 2.3),
           c(-0.2, -0.8, 0.4), c(-0.3, -1.2, 1.5))
plot(0, type="n", xlim=c(-5, 5), ylim=c(-5, 5), xlab="", ylab="")
cistrip(x, at=1:4)
abline(v=0, lty=2, col="lightgray")
cistrip(x, at=1:4, horiz=FALSE, lwd=3, d=0.2)
abline(h=0, lty=2, col="lightgray")



