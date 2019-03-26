## ----igrid---------------------------------------------------------------
library(chebpol)
par(mfrow=c(2,2))
grid <- list(x=seq(-1,1,length.out=12), y=seq(-1,1,length.out=10))
plot(y~x,data=expand.grid(grid),typ='p',col='blue',main='Uniform 2d-grid')
grid <- chebknots(c(x=12,y=10))
plot(y ~ x, data=expand.grid(grid), typ='p',col='blue',main='Chebyshev 2d-grid')
grid <- list(x=seq(-1,1,length.out=12)^3L, y=sort(c(0,runif(10,-1,1),1)))
plot(y ~ x, data=expand.grid(grid), typ='p',col='blue',main='Irregular 2d-grid')
data <- cbind(x=runif(120,-1,1),y=runif(120,-1,1))
plot(y ~ x, data=data, typ='p', col='blue', main='Scattered data')

## ----fundef, fig.dim=c(4,4)----------------------------------------------
f <- function(x) 1/mean(log1p(0.5 + sin(0.8+2.3*pi*c(0.6,1.4)*(x+0.09)^3)^2))
s <- seq(-1, 1, length.out=1000)
plot(s, sapply(s,f), typ='l')

## ----cheb, fig.dim=c(4,4)------------------------------------------------
ch30 <- ipol(f, dims=30, method='cheb')
ch60 <- ipol(f, dims=60, method='cheb')
plot(s, sapply(s,f), typ='l')
lines(s, ch30(s), col='blue', lty=2)
lines(s, ch60(s), col='red', lty=2)
legend('topleft',c('fun','30 knots','60 knots'),fill=c('black','blue','red'))

## ----uni, fig.dim=c(4,4)-------------------------------------------------
plot(s, sapply(s,f), typ='l')
uni <- ipol(f, dims=20, method='uniform')
grid <- seq(-1,1,len=20)
ml <- ipol(f, grid=grid, method='multilinear')
fh <- ipol(f, grid=grid, method='fh', k=3)
lines(s, uni(s), col='blue', lty=2)
lines(s, ml(s), col='green', lty=2)
lines(s, fh(s, threads=4), col='red', lty=2)
legend('topleft',c('fun','uni','ml','fh'),fill=c('black','blue','green','red'))

## ----echo=FALSE----------------------------------------------------------
set.seed(46)

## ----fig.align='center',fig.dim=c(7,7)-----------------------------------
f1 <- function(x) 1.5/log(5+sin(pi/2*(x[1]^2-2*x[2]^2)))
ch1 <- ipol(f1, dims=c(9,9), method='cheb')
igrid <- list(x=seq(-1,1,len=9), y=seq(-1,1,len=9))
st1 <- ipol(f1, grid=igrid, method='hstalker')
fh1 <- ipol(f1, grid=igrid, method='fh', k=3)
y <- x <- seq(-1,1,len=70)
testset <- expand.grid(list(x=x,y=y))
data <- cbind(testset,fun= apply(testset,1,f1), cheb=ch1(t(testset)), 
              stalker=st1(t(testset)), F.H.=fh1(t(testset)))

lattice::contourplot(stalker+F.H.+fun+cheb ~ x+y, data=data, cuts=10,
          labels=FALSE, layout=c(2,2), 
          main='Level plots of function and interpolations')

## ----poly,echo=FALSE-----------------------------------------------------
set.seed(43)

## ----fig.align='center', fig.width=7, fig.height=7-----------------------
f2 <- function(x) 1.2/mean(log(3.1 + sin(0.7+1.8*pi*(x+0.39*x[1]^2-x[2]^2))^2))
ph1 <- ipol(f1, knots=matrix(runif(200,-1,1),2), method='polyharmonic', k=2)
ph2 <- ipol(f2, knots=matrix(runif(4000,-1,1),2), method='polyharmonic', k=3)
data <- cbind(testset,fun1= apply(testset,1,f1), poly1=ph1(t(testset)), 
              fun2=apply(testset,1,f2), poly2=ph2(t(testset)))

lattice::contourplot(fun2+poly2+fun1+poly1 ~ x+y, data=data, cuts=10,
          labels=FALSE, layout=c(2,2), 
          main='Level plots of functions and interpolations')
# compute L2-error (rmse)
sqrt(cubature::hcubature(function(x) as.matrix((ph2(x)-apply(x,2,f2))^2), rep(-1,2), rep(1,2),
          vectorInterface=TRUE, absError=1e-6)$integral/4)

## ----volcano, fig.align='center', fig.pos='!ht', fig.cap='Volcanoes', out.width='.37\\linewidth', fig.ncol=2, fig.subcap=c('low resolution','polyharmonic','Floater-Hormann','simplex')----
data(volcano)
volc <- volcano[seq(1,nrow(volcano),3),seq(1,ncol(volcano),3)]/10 #low res volcano
grid <- list(x=as.numeric(seq_len(nrow(volc))), y=as.numeric(seq_len(ncol(volc))))
fh <- ipol(volc, grid=grid, method='fh', k=0)
knots <- t(expand.grid(grid))
sl <- ipol(volc, knots=knots, method='simplex')
ph <- ipol(volc, knots=knots, method='poly')
g <- list(x=seq(1,nrow(volc), len=50), y=seq(1,ncol(volc),len=50))
par(mar=rep(0,4)); col <- 'green'
light <- list(specular=0.2,ambient=0.0,diffuse=0.6)
plot3D::persp3D(grid$x, grid$y, volc, colvar=NULL, lighting=light,
        theta=135, ltheta=90, lphi=40, col=col, axes=FALSE, bty='n',scale=FALSE)
for(f in list(ph, fh, sl)) {
plot3D::persp3D(g$x, g$y, evalongridV(f,grid=g), colvar=NULL, lighting=light,
        theta=135, ltheta=90, lphi=40, col=col, axes=FALSE, bty='n', scale=FALSE)
}

## ----para----------------------------------------------------------------
m <- matrix(runif(2*6,-1,1),2)
print(m)
print(ph2(m, threads=3))

## ----fast----------------------------------------------------------------
f <- ipol(sin, grid=seq(-pi,pi,length.out=1000), method='hstalker')
a <- runif(1e6)
system.time(sin(a))
system.time(f(a,threads=8))

