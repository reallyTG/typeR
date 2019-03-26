library(SECP)


### Name: fds3s
### Title: Mass fractal dimension of sampling 3D clusters
### Aliases: fds3s

### ** Examples

# # # # # # # # # # # # # # # # #
# Example 1: Isotropic set cover
# # # # # # # # # # # # # # # # #
pc <- .311608
p1 <- pc - .01
p2 <- pc + .01
lx <- 33; ss <- (lx+1)/2
rf1 <- fssi30(n=100, x=lx, p=p1)
rf2 <- fssi30(n=100, x=lx, p=p2)
bnd <- isc3s(k=9, x=dim(rf1))
fd1 <- fds3s(rfq=rf1, bnd=bnd)
fd2 <- fds3s(rfq=rf2, bnd=bnd)
w1 <- fd1$model[,"w"]; w2 <- fd2$model[,"w"]
r1 <- fd1$model[,"r"]; r2 <- fd2$model[,"r"]
rr <- seq(min(r1)-.2, max(r1)+.2, length=100)
ww1 <- predict(fd1, newdata=list(r=rr), interval="conf")
ww2 <- predict(fd2, newdata=list(r=rr), interval="conf")
s1 <- paste(round(confint(fd1)[2,], digits=3), collapse=", ")
s2 <- paste(round(confint(fd2)[2,], digits=3), collapse=", ")
x <- z <- seq(lx)
y1 <- rf1[,ss,]; y2 <- rf2[,ss,]
par(mfrow=c(2,2), mar=c(3,3,3,1), mgp=c(2,1,0))
image(x, z, y1, zlim=c(0, 3*mean(y1)), cex.main=1,
      main=paste("Isotropic set cover and a 3D clusters\n",
                 "frequency in the y=",ss," slice with\n",
                 "(1,0)-neighborhood and p=", 
                 round(p1, digits=3), sep=""))
rect(bnd["x1",], bnd["z1",], bnd["x2",], bnd["z2",])
abline(h=ss, lty=2); abline(v=ss, lty=2)
image(x, z, y2, zlim=c(0, 3*mean(y2)), cex.main=1,
      main=paste("Isotropic set cover and a 3D clusters\n",
                 "frequency in the y=",ss," slice with\n",
                 "(1,0)-neighborhood and p=", 
                 round(p2, digits=3), sep=""))
rect(bnd["x1",], bnd["z1",], bnd["x2",], bnd["z2",])
abline(h=ss, lty=2); abline(v=ss, lty=2)
plot(r1, w1, pch=3, ylim=range(c(w1,w2)), cex.main=1,
     main=paste("0.95 confidence interval for the mass\n", 
                "fractal dimension is (",s1,")", sep=""))
matlines(rr, ww1, lty=c(1,2,2), col=c("black","red","red"))
plot(r2, w2, pch=3, ylim=range(c(w1,w2)), cex.main=1,
     main=paste("0.95 confidence interval for the mass\n", 
                "fractal dimension is (",s2,")", sep=""))
matlines(rr, ww2, lty=c(1,2,2), col=c("black","red","red"))

# # # # # # # # # # # # # # # # #
# Example 2: Anisotropic set cover, dir=3
# # # # # # # # # # # # # # # # #
pc <- .311608
p1 <- pc - .01
p2 <- pc + .01
lx <- 33; ss <- (lx+1)/2
ssz <- seq(lx^2+lx+2, 2*lx^2-lx-1) 
rf1 <- fssi30(n=100, x=lx, p=p1, set=ssz, all=FALSE)
rf2 <- fssi30(n=100, x=lx, p=p2, set=ssz, all=FALSE)
bnd <- asc3s(k=9, x=dim(rf1), dir=3)
fd1 <- fds3s(rfq=rf1, bnd=bnd)
fd2 <- fds3s(rfq=rf2, bnd=bnd)
w1 <- fd1$model[,"w"]; w2 <- fd2$model[,"w"]
r1 <- fd1$model[,"r"]; r2 <- fd2$model[,"r"]
rr <- seq(min(r1)-.2, max(r1)+.2, length=100)
ww1 <- predict(fd1, newdata=list(r=rr), interval="conf")
ww2 <- predict(fd2, newdata=list(r=rr), interval="conf")
s1 <- paste(round(confint(fd1)[2,], digits=3), collapse=", ")
s2 <- paste(round(confint(fd2)[2,], digits=3), collapse=", ")
x <- z <- seq(lx)
y1 <- rf1[,ss,]; y2 <- rf2[,ss,]
par(mfrow=c(2,2), mar=c(3,3,3,1), mgp=c(2,1,0))
image(x, z, y1, zlim=c(0, .3), cex.main=1,
      main=paste("Anisotropic set cover and a 3D clusters\n",
                 "frequency in the y=",ss," slice with\n",
                 "(1,0)-neighborhood and p=", 
                 round(p1, digits=3), sep=""))
rect(bnd["x1",], bnd["z1",], bnd["x2",], bnd["z2",])
abline(v=ss, lty=2)
image(x, z, y2, zlim=c(0, .3), cex.main=1,
      main=paste("Anisotropic set cover and a 3D clusters\n",
                 "frequency in the y=",ss," slice with\n",
                 "(1,0)-neighborhood and p=", 
                 round(p2, digits=3), sep=""))
rect(bnd["x1",], bnd["z1",], bnd["x2",], bnd["z2",])
abline(v=ss, lty=2)
plot(r1, w1, pch=3, ylim=range(c(w1,w2)), cex.main=1,
     main=paste("0.95 confidence interval for the mass\n", 
                "fractal dimension is (",s1,")", sep=""))
matlines(rr, ww1, lty=c(1,2,2), col=c("black","red","red"))
plot(r2, w2, pch=3, ylim=range(c(w1,w2)), cex.main=1,
     main=paste("0.95 confidence interval for the mass\n", 
                "fractal dimension is (",s2,")", sep=""))
matlines(rr, ww2, lty=c(1,2,2), col=c("black","red","red"))



