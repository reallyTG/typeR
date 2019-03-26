library(cwhmisc)


### Name: coords
### Title: convert coordinates, angles, simple vector operations
### Aliases: toPol toRec toSph toXyz rotZ rotA rotV rotL getAp angle scprod
###   vecprod %v% %s%
### Keywords: character,arith

### ** Examples

  pkg <- TRUE # FALSE for direct use
  (x <- toPol(1.0, 1.0) ) # $r 1.41421, $p 0.785398 = pi/4
  (y <- toRec(2.0,pi) ) # $x -2, $y 2.44921e-16
  toPol(y[1], y[2]) # 2, pi
  toRec( x[1], x[2]) # 1, 1
  rotZ( 1, 0, pi/2 )  # 6.123032e-17 1.000000e+00
  x <- 1;  y <- 2;  z <- 3
  (R <- toSph(c(x,y,z)) )  # r= 3.7416574, theta= 0.64052231, phi= 1.1071487
  c(R[1],180/pi*(R[2:3])) #  3.741657 36.6992252 63.434949
  (w <- toXyz(R[1], R[2], R[3]))  #  = x,y,z
  rotZ(1,2,pi/2)  # -2, 1
  opar <- par(mfrow=c(2,4))
  x <- seq(0,1,0.05)
  phi <- c(pi/6,pi/4,-pi/6)
  Data <- matrix(c(x^2*10,(x^2-10*x)*4,(x+10)*1.5),ncol=3)
##  Data <- matrix(c(rnorm(99)*10,rnorm(99)*4,rnorm(99)*1.5),ncol=3)
  lim <- range(c(Data,-Data))*1.5
  RD <-  Data %*% rotL(phi[1],1,2)   # !! # rotate around z-axis
  RD2 <- RD %*% rotL(phi[2],2,3) # !! # rotate further around x
  RD3 <- RD2 %*% rotL(phi[3],1,2) # !! # rotate back around z
 ## Not run: 
##D   plot(Data[,-3],xlim=lim,ylim=lim,xlab="x",ylab="y",pty="s")
##D   plot(RD[,-3],xlim=lim,ylim=lim,xlab="RD x",ylab="y",pty="s",pch=5,col="red")
##D   plot(RD2[,-3],xlim=lim,ylim=lim,xlab="RD2 x",ylab="y",pch=6,col="blue")
##D   plot(RD3[,-3],xlim=lim,ylim=lim,xlab="RD3 x",ylab="RD3 y",col="magenta")
##D   plot(Data[,1],RD3[,1])
##D   plot(Data[,2],RD3[,2])
##D   plot(Data[,3],RD3[,3])
##D  
## End(Not run)
  m <- rotL(phi[1],1,2) %*% rotL(phi[2],2,3) %*% rotL(phi[3],1,2) # !! #
  if (pkg) {
    m <- rotL(phi[1],1,2) %*% rotL(phi[2],2,3) %*% rotL(phi[3],1,2) # !! #
    round(m %*% t(m),2) #!! # composite rotation matrix and orthogonality,
       # should be diag(3)
  } else {
    m <- rotL(phi[1],1,2) %*% rotL(phi[2],2,3) %*% rotL(phi[3],1,2) # !! #
    round(m %*% t(m),2) #!! # composite rotation matrix and orthogonality,
       # should be diag(3)
  }
  eye <- c(0.5,2.5,4)
  re  <- rotV(eye)
  getAp(re) #$A [1] -9.805807e-01  1.961161e-01 -1.193931e-16
# $phi [1] 0.5674505
  round(rotA(pi/1.5, c(1,1,1)),2)  # 60 degrees around octant bisector
# [1,]    0    1    0  is permutation of axes 1 -> 2 -> 3 -> 1
# [2,]    0    0    1
# [3,]    1    0    0



