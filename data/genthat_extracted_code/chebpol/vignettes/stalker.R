## ----fig.dim=c(4,4),echo=FALSE-------------------------------------------
library(chebpol)
set.seed(42)
N <- 10
pts <- as.numeric(seq(1,N))
val <- runif(N)
val[5] <- val[4]
val[6] <- val[6] - 0.3
val[7] <- val[8] + 0.00001
s <- seq(1,N,len=1000)
plot(pts,val,pch=20,xlab='x',ylab='y')
ml <- ipol(val,grid=pts,method='multi')
lines(s,ml(s))

## ----fig.dim=c(5,5), out.width='0.5\\linewidth', echo=FALSE--------------
plot(pts,val,pch=20,xlab='x',ylab='y')
for(i in seq_along(pts)) {
    lines(pts[i]+c(-1,1),c(val[i],val[i]),col=c('blue','green','red')[i%%3+1])
}

## ----fig.dim=c(5,5), out.width='0.5\\linewidth', echo=FALSE--------------
plot(pts,val,pch=20,xlab='x',ylab='y',ylim=c(0,1.1))
for(i in seq_along(pts)[c(-1,-length(pts))]) {
    a <- val[i]
    b <- (val[i+1] - val[i-1])/2
    c <- val[i+1]-a-b
    ss <- seq(-1,1,len=20)
    lines(ss+i,a+b*ss+c*ss^2,col=c('blue','green','red')[i%%3+1])
}

## ----echo=FALSE,fig.dim=c(5,5),out.width='0.5\\linewidth'----------------
vplus <- 2
vmin <- -0.2
c <- (vplus+vmin)/2
b <- (vplus-vmin)/2
s <- seq(-1,1,len=100)
r <- abs(b/c)
plot(s,b*s + c*s^2,typ='l',xlab='x',ylab='y',lwd=2)
lines(s,b*s + c*abs(s)^r,col='blue',lwd=2)
points(c(-1,0,1),c(vmin,0,vplus),pch=20)
abline(h=vmin,lty=2)
legend('topleft',legend=c(sprintf('%.1fx + %.1fx^2',b,c),sprintf('%.1fx + %.1f|x|^%.1f',b,c,r)),
       col=c('black','blue'),lty=1)

## ----basis,echo=FALSE,fig.dim=c(7,5), fig.align='center', fig.cap='"Basis functions"'----
s <- seq(-1,1,len=100)
plot(range(s),c(-0.7,1.7),pch='',xlab='x',ylab='y')
v0 <- seq(-0.7,1.7,len=41)
f0spline <- function(f0) {
  b <- 0.5
  c <- 0.5*(1-2*f0)
  if(b < 2*abs(c) && abs(c) < b)
    r <- abs(b/c)
  else if (abs(c) < 2*b && abs(b) < abs(c))
    r <- abs(c/b)
  else
    r <- 2
  f0 + b*s + c*abs(s)^r
}
for(f0 in v0) {
  col <- if( (f0 < 0.75 && f0 > 0.25) || (f0 > 1.5 || f0 < -0.5) ) 
           'darkblue' 
         else if(f0 < 1 && f0 > 0)
           'blue'
         else
           'lightblue'
  lines(s,f0spline(f0),col=col)
  points(0,f0,pch=20)
}
# illustrate overshoot
clip(0,0.5,-2,2)
abline(h=-0.7,lty=2)
clip(-0.5/(2*(0.5+0.7)),0.5,-2,2)
abline(h=-0.7-0.25/(4*(0.5+0.7)), lty=2)
clip(-2,2,-2,2)
text(x=0.7,y=-0.63,'} overshoot',pos=1)

## ----failure,echo=FALSE,fig.dim=c(7,5), fig.align='center', fig.cap='"Basis functions"'----
s <- seq(-1,1,len=100)
vseq <- seq(-1,1,len=41)
rr <- m <- v <- list()
for(i in seq_along(vseq)) {
  #  double iD = 1.0/(dmin*pow(dplus,r) + pow(dmin,r)*dplus);
  #  double b = (vplus*pow(dmin,r) - vmin*pow(dplus,r))*iD;
  #  double c = (vplus*dmin + vmin*dplus)*iD;
  b <- 0.5*(1-vseq[[i]])
  c <- 0.5*(1+vseq[[i]])
  if(b < 2*abs(c) && abs(c) <= b)
    r <- abs(b/c)
  else if (abs(c) < 2*b && abs(b) < abs(c))
    r <- abs(c/b)
  else
    r <- 2

  rr[[i]] <- r
  m[[i]] <- abs(c) <= b
  v[[i]] <- b*s + c*abs(s)^r
}
plot(range(s),do.call(range,c(v,list(finite=TRUE))),pch='',xlab='x',ylab='y')
for(i in seq_along(v)) {
  cl <- if(identical(rr[[i]],2)) 'darkblue' else if(isTRUE(m[[i]])) 'blue' else 'lightblue'
  lines(s,v[[i]],col=cl)
}
points(rep(-1,length(vseq)),vseq,pch=20)

## ----blending, fig.dim=c(4,4),fig.cap='Blending functions'---------------
linear <- function(t) t
cubic <- function(t) -2*t^3 + 3*t^2
sigmoid <- function(t) ifelse(t<0.5, 0.5*exp(2-1/t), 1-0.5*exp(2-1/(1-t)))
parodic <- function(t) ifelse(t<0.5, 0.5*exp(4-1/t^2), 1-0.5*exp(4-1/(1-t)^2))
square <- function(t) ifelse(t<0.5, 0, 1)
s <- seq(0,1,length=100)
plot(s,sigmoid(s),typ='l',ylab='y')
lines(s,linear(s), col='blue')
lines(s,cubic(s), col='green')
lines(s,parodic(s), col='red')
lines(s,square(s), col='cyan')
legend('topleft',legend=c('linear','cubic','sigmoid','parodic','square'),
       col=c('blue','green','black','red','cyan'),lty=1)

## ----2dhyp,fig.dim=c(4,4),fig.cap='Hyperbolic 2d function',echo=FALSE----
a <- -2
b.1 <- -2; c.1 <- -1/3; d.1 <- 6
b.2 <- 0; c.2 <- 1/3; d.2 <- -4

f <- function(x) a + b.1*x[1] + b.2*x[2] + d.1/(1+c.1*x[1]) + d.2/(1+c.2*x[2])
g <- list(x=seq(-1,1,len=50), y=seq(-1,1,len=50))
light <- list(specular=0.2,ambient=0.0,diffuse=0.6)
par(mar=rep(0,4))
plot3D::persp3D(g$x, g$y, evalongrid(f,grid=g), colvar=NULL, lighting=light,
        theta=45, ltheta=10, lphi=40, col='green')
plot3D::points3D(c(0,1,0,-1,0),c(0,0,1,0,-1),c(0,1,1,1/2,-2)+0.05,pch=20,add=TRUE,colvar=NULL)

## ----2dblending,fig.dim=c(3,3), fig.cap='Blending',echo=FALSE------------
#  par(mar=rep(0,4))
  plot(c(0,1,1,0),c(0,0,1,1),pch=20,xlab='',ylab='')
  points(0.3,0.4,col='blue')
  abline(v=0.3,h=0.4,col='blue',lty=2)

## ----meanblend, fig.cap='2d blending', fig.pos='!ht', fig.dim=c(4,4),out.width='0.4\\linewidth',echo=FALSE,fig.ncol=2,fig.subcap=c('square','mean','linear','cubic')----
set.seed(49)
NN <- 3
grid <- list(x=as.numeric(seq(0,NN)),y=as.numeric(seq(0,NN)))
value <- runif((NN+1)^2)
ip <- ipol(value,grid=grid, method='hstalker')
g <- list(x=seq(0,NN,len=50), y=seq(0,NN,len=50))
light <- list(specular=0.2,ambient=0.0,diffuse=0.6)
for(bl in c('square','mean','linear','cubic')) {
  par(mar=rep(0,4))
  plot3D::persp3D(g$x, g$y, evalongridV(ip,grid=g,blend=bl), colvar=NULL, lighting=light,
                  theta=45, ltheta=10, lphi=40, col='green',bty='n',axes=FALSE,zlim=range(value))
  plot3D::points3D(rep(grid$x,NN+1), rep(grid$y,each=NN+1), 
                   value+0.01,pch=20,add=TRUE,colvar=NULL)
}

## ----echo=FALSE,fig.dim=c(6,4)-------------------------------------------
pts <- pts-min(pts)
pts <- pts/max(pts)
plot(pts,val,pch=20,xlab='x',ylab='y',ylim=c(0,1.1))
ns <- splinefun(pts,val,method='natural')
ms <- splinefun(pts,val,method='mono')
st <- ipol(val,grid=pts,method='stalker')
hst <- ipol(val,grid=pts,method='hstalker')
s <- seq(0,1,len=1000)
lines(s,ns(s),col='blue')
lines(s,ms(s),col='green')
lines(s, st(s), col='magenta',lty=2)
lines(s, hst(s),col='red',lty=2)
legend('topright',legend=c('stalker','mono','natural','hyperbolic'),
       col=c('magenta','green','blue','red'),lty=c(2,1,1,2))

## ----fig.dim=c(6,4),echo=FALSE-------------------------------------------
val <- sort(val)
plot(pts,val,pch=20,xlab='x',ylab='y',ylim=c(0,1.1))
ns <- splinefun(pts,val,method='natural')
ms <- splinefun(pts,val,method='mono')
st <- ipol(val,grid=pts, method='stalker')
hst <- ipol(val,grid=pts,method='hstalker')
s <- seq(0,1,len=1000)
lines(s,ns(s),col='blue')
lines(s,ms(s),col='green')
lines(s, st(s), col='magenta',lty=2)
lines(s, hst(s), col='red',lty=2)
legend('topleft',legend=c('stalker','mono','natural','hyperbolic'),
       col=c('magenta','green','blue','red'),lty=c(2,1,1,2))

## ----fig.dim=c(6,4),echo=FALSE-------------------------------------------
set.seed(25)
val <- rep(runif(N/2),each=2) + c(0,1e-16)
plot(pts,val,pch=20,xlab='x',ylab='y',ylim=c(0,1.1))
ns <- splinefun(pts,val,method='natural')
ms <- splinefun(pts,val,method='mono')
st <- ipol(val,grid=pts, method='stalker')
hst <- ipol(val,grid=pts,method='hstalker')
s <- seq(0,1,len=1000)
lines(s,ns(s),col='blue')
lines(s,ms(s),col='green')
lines(s, st(s), col='magenta',lty=2)
lines(s, hst(s), col='red',lty=2)
legend('topleft',legend=c('stalker','mono','natural','hyperbolic'),
       col=c('magenta','green','blue','red'),lty=c(2,1,1,2))

## ----volcano, fig.dim=c(4,4), fig.align='center', fig.pos='!ht', fig.cap='Maungawhau', out.width='.37\\linewidth', fig.ncol=2, fig.subcap=c('low resolution','multilinear','stalker','thin plate spline')----
data(volcano)
volc <- volcano[seq(1,nrow(volcano),3),seq(1,ncol(volcano),3)]/10 #low res volcano
grid <- list(x=as.numeric(seq_len(nrow(volc))), y=as.numeric(seq_len(ncol(volc))))
ph <- ipol(volc, grid=grid, method='polyharmonic',k=2)
st <- ipol(volc, grid=grid, method='stalker')
ml <- ipol(volc, grid=grid, method='multilinear')
g <- list(x=seq(1,nrow(volc), len=50), y=seq(1,ncol(volc),len=50))
par(mar=rep(0,4)); col <- 'green'
light <- list(specular=0.1,ambient=0.0,diffuse=0.6)
plot3D::persp3D(grid$x, grid$y, volc, colvar=NULL, lighting=light,
        theta=45, ltheta=0, lphi=40, col=col, axes=FALSE, bty='n',scale=FALSE)
for(f in list(ml, st, ph)) {
  plot3D::persp3D(g$x, g$y, evalongridV(f,grid=g), colvar=NULL, lighting=light,
        theta=45, ltheta=0, lphi=40, col=col, axes=FALSE, bty='n', scale=FALSE)
}

## ----random, fig.dim=c(4,4), fig.pos='!ht', fig.align='center',fig.cap='Random surface',out.width='.5\\linewidth',fig.ncol=2,fig.subcap=c('stalker', 'thin plate spline','hyperbolic stalker','Floater-Hormann')----
set.seed(52); N <- 8
grid <- list(x=seq(0,1,length=N)+c(0,rnorm(N-2,sd=0.3/N),0), 
             y=seq(0,1,length=N)+c(0,rnorm(N-2,sd=0.3/N),0))
val <- matrix(runif(N*N,0,0.4),N)
st <- ipol(val,grid=grid, method='stalker')
ph <- ipol(val,grid=grid, method='polyharmonic', k=2)
fh <- ipol(val,grid=grid, method='fh', k=0)
hst <- ipol(val,grid=grid, method='hstalker')
g <- list(x=seq(0,1, len=50), y=seq(0,1,len=50))
for(f in list(st, ph, hst, fh)) {
  par(mar=rep(0,4))
  plot3D::persp3D(g$x, g$y, evalongridV(f,grid=g), colvar=NULL, lighting=light,phi=60,
         theta=210, ltheta=225, lphi=45, col='green', axes=FALSE, bty='n', scale=FALSE,zlim=c(0,1))
  pts <- evalongridV(f,grid=grid)+0.00
  plot3D::points3D(rep(grid$x,N),rep(grid$y,each=N),pts,add=TRUE,colvar=NULL,pch=20)
}

## ----eval=FALSE----------------------------------------------------------
#  st <- ipol(val,grid=grid,method='stalker')
#  st(x,blend='linear')

## ----eval=FALSE----------------------------------------------------------
#  st <- ipol(val,grid=grid,method='hstalker')

