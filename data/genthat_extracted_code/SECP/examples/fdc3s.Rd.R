library(SECP)


### Name: fdc3s
### Title: Mass fractal dimension of a 3D cluster
### Aliases: fdc3s

### ** Examples

# # # # # # # # # # # # # # # # #
# Example 1: Isotropic set cover
# # # # # # # # # # # # # # # # #
pc <- .311608
p1 <- pc - .02
p2 <- pc + .02
lx <- 33; ss <- (lx+1)/2
set.seed(20120627); ac1 <- ssi30(x=lx, p=p1)
set.seed(20120627); ac2 <- ssi30(x=lx, p=p2)
bnd <- isc3s(k=9, x=dim(ac1))
fd1 <- fdc3s(acc=ac1, bnd=bnd)
fd2 <- fdc3s(acc=ac2, bnd=bnd)
n1 <- fd1$model[,"n"]; n2 <- fd2$model[,"n"]
r1 <- fd1$model[,"r"]; r2 <- fd2$model[,"r"]
rr <- seq(min(r1)-.2, max(r1)+.2, length=100)
nn1 <- predict(fd1, newdata=list(r=rr), interval="conf")
nn2 <- predict(fd2, newdata=list(r=rr), interval="conf")
s1 <- paste(round(confint(fd1)[2,], digits=3), collapse=", ")
s2 <- paste(round(confint(fd2)[2,], digits=3), collapse=", ")
x <- z <- seq(lx)
y1 <- ac1[,ss,]; y2 <- ac2[,ss,]
par(mfrow=c(2,2), mar=c(3,3,3,1), mgp=c(2,1,0))
image(x, z, y1, cex.main=1,
      main=paste("Isotropic set cover and\n",
                 "a 3D cluster in the y=",ss," slice with\n",
                 "(1,0)-neighborhood and p=", 
                 round(p1, digits=3), sep=""))
rect(bnd["x1",], bnd["z1",], bnd["x2",], bnd["z2",])
abline(h=ss, lty=2); abline(v=ss, lty=2)
image(x, z, y2, cex.main=1,
      main=paste("Isotropic set cover and\n",
                 "a 3D cluster in the y=",ss," slice with\n",
                 "(1,0)-neighborhood and p=", 
                 round(p2, digits=3), sep=""))
rect(bnd["x1",], bnd["z1",], bnd["x2",], bnd["z2",])
abline(h=ss, lty=2); abline(v=ss, lty=2)
plot(r1, n1, pch=3, ylim=range(c(n1,n2)), cex.main=1,
     main=paste("0.95 confidence interval for the mass\n", 
                "fractal dimension is (",s1,")", sep=""))
matlines(rr, nn1, lty=c(1,2,2), col=c("black","red","red"))
plot(r2, n2, pch=3, ylim=range(c(n1,n2)), cex.main=1,
     main=paste("0.95 confidence interval for the mass\n", 
                "fractal dimension is (",s2,")", sep=""))
matlines(rr, nn2, lty=c(1,2,2), col=c("black","red","red"))

# # # # # # # # # # # # # # # # #
# Example 1: Anisotropic set cover, dir=3
# # # # # # # # # # # # # # # # #
pc <- .311608
p1 <- pc - .02
p2 <- pc + .02
lx <- 33; ss <- (lx+1)/2
ssz <- seq(lx^2+lx+2, 2*lx^2-lx-1)
set.seed(20120627); ac1 <- ssi30(x=lx, p=p1, set=ssz, all=FALSE)
set.seed(20120627); ac2 <- ssi30(x=lx, p=p2, set=ssz, all=FALSE)
bnd <- asc3s(k=9, x=dim(ac1), dir=3)
fd1 <- fdc3s(acc=ac1, bnd=bnd)
fd2 <- fdc3s(acc=ac2, bnd=bnd)
n1 <- fd1$model[,"n"]; n2 <- fd2$model[,"n"]
r1 <- fd1$model[,"r"]; r2 <- fd2$model[,"r"]
rr <- seq(min(r1)-.2, max(r1)+.2, length=100)
nn1 <- predict(fd1, newdata=list(r=rr), interval="conf")
nn2 <- predict(fd2, newdata=list(r=rr), interval="conf")
s1 <- paste(round(confint(fd1)[2,], digits=3), collapse=", ")
s2 <- paste(round(confint(fd2)[2,], digits=3), collapse=", ")
x <- z <- seq(lx)
y1 <- ac1[,ss,]; y2 <- ac2[,ss,]
par(mfrow=c(2,2), mar=c(3,3,3,1), mgp=c(2,1,0))
image(x, z, y1, cex.main=1,
      main=paste("Anisotropic set cover and\n",
                 "a 3D cluster in the y=",ss," slice with\n",
                 "(1,0)-neighborhood and p=", 
                 round(p1, digits=3), sep=""))
rect(bnd["x1",], bnd["z1",], bnd["x2",], bnd["z2",])
abline(v=ss, lty=2)
image(x, z, y2, cex.main=1,
      main=paste("Anisotropic set cover and\n",
                 "a 3D cluster in the y=",ss," slice with\n",
                 "(1,0)-neighborhood and p=", 
                 round(p2, digits=3), sep=""))
rect(bnd["x1",], bnd["z1",], bnd["x2",], bnd["z2",])
abline(v=ss, lty=2)
plot(r1, n1, pch=3, ylim=range(c(n1,n2)), cex.main=1,
     main=paste("0.95 confidence interval for the mass\n", 
                "fractal dimension is (",s1,")", sep=""))
matlines(rr, nn1, lty=c(1,2,2), col=c("black","red","red"))
plot(r2, n2, pch=3, ylim=range(c(n1,n2)), cex.main=1,
     main=paste("0.95 confidence interval for the mass\n", 
                "fractal dimension is (",s2,")", sep=""))
matlines(rr, nn2, lty=c(1,2,2), col=c("black","red","red"))



