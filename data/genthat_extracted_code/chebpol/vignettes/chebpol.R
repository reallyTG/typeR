## ----echo=FALSE----------------------------------------------------------
library(chebpol)
#opts_chunk$set(fig.width=4, fig.height=4)

## ----fig.dim=c(4,4)------------------------------------------------------
f <- function(x) cos(3*pi*x)/(1+25*(x-0.25)^2)
ch <- ipol(f,dims=15,method='chebyshev')
s <- seq(-1,1,length.out=401)
plot(s, f(s),type='l')
lines(s, ch(s), col='red')
kn <- chebknots(15)[[1]]
points(kn,f(kn))

## ----fig.dim=c(4,4)------------------------------------------------------
plot(s,f(s),type='l')
lines(s,ch(s), col='red')
points(kn,f(kn))
uc <- ipol(f, dims=15, method='uniform')
lines(s,uc(s),col='blue')

## ----multi---------------------------------------------------------------
library(chebpol)
f <- function(x) log(x[[1]])*sqrt(x[[2]])/log(sum(x))
ch <- ipol(f, dims=c(5,8), intervals=list(c(1,2), c(15,20)), method='chebyshev')
uc <- ipol(f, dims=c(5,8), intervals=list(c(1,2), c(15,20)), method='uniform')
tp <- c(runif(1,1,2), runif(1,15,20))
cat('arg:',tp,'true:', f(tp), 'ch:', ch(tp), 'uc:',uc(tp),'\n')

## ----fig.dim=c(4,4)------------------------------------------------------
f <- function(x) cos(3*pi*x)/(1+25*(x-0.25)^2)
gr <- log(seq(exp(-1),exp(1),length=15))
chg <- ipol(f, grid=gr, method='general')
plot(s, f(s), col='black', type='l')
lines(s, chg(s), col='blue')
points(gr,f(gr))

## ----fig.dim=c(5,5)------------------------------------------------------
f <- function(x) 1/(1+25*x^2)
# Uniform grid:
unigrid <- list(seq(-3,2,length.out=20))
uni <- ipol(f, grid=unigrid, k=2, method='fh')
st <- ipol(f, grid=unigrid, method='hstalker')
ch <- ipol(f, dims=20, intervals=c(-3,2), method='chebyshev')
s <- seq(-3,2,length.out=1000)
plot(s,f(s),ylim=range(uni(s),f(s),ch(s)),typ='l')
lines(s,uni(s),col='blue')
points(unigrid[[1]],uni(unigrid[[1]]),col='blue',pch=20)
lines(s,ch(s),col='green')
lines(s,st(s),col='red',lty=2)
legend('topleft',c('function','FH','chebyshev','stalker'),fill=c('black','blue','green','red'))

## ----fig.dim=c(4,4)------------------------------------------------------
f <- function(x) sign(sum(x^3)-0.1)*
                  sqrt(abs(25*prod(x)-4))/
                  (1+25*sum(x)^2)
grid <- replicate(4,list(seq(-1,1,length=15)))
ml <- ipol(f, grid=grid, method='multilinear')
st <- ipol(f, grid=grid, method='hstalker')
s <- seq(-1,1,length=400)
curve <- function(x) c(cos(1.2*pi*x),
                       sin(1.5*pi*x^3), 
                       x^2, -x/(1+x^2))
wf <- sapply(s,function(x) f(curve(x)))
wml <- sapply(s,function(x) ml(curve(x)))
wst <- sapply(s,function(x) st(curve(x)))
plot(s,wf,typ='l')  # function
lines(s,wml,col='blue') # multilinear interpolation
lines(s,wst,col='green',lty=2) # hyperbolic stalker

## ----echo=FALSE----------------------------------------------------------
set.seed(42)

## ----fig.width=5,fig.asp=1.1,fig.align='center',message=FALSE------------
f <- function(x) sqrt(1-sum(x^2))
theta <- runif(200, 0, 2*pi)
r <- sqrt(runif(200))
knots <- rbind(r*cos(theta), r*sin(theta))
g <- ipol(f, knots=knots, method='simplexlinear')
# yank out the simplices for drawing
simp <- get('dtri', environment(get('fun', environment(g))))
drawtri <- function(pts,col) lines(c(pts[1,],pts[1,1]), c(pts[2,],pts[2,1]), col=col)
plot(knots[1,], knots[2,], typ='p', pch=20, xlab='x', ylab='y', main='Triangulation')
invisible(apply(simp,2,function(kn) drawtri(knots[,kn], col='blue')))
theta <- runif(7, 0, 2*pi)
r <- sqrt(runif(7))
test <- rbind(r*cos(theta), r*sin(theta))
rbind(true=apply(test,2,f), sl=g(test,epol=TRUE))

## ----poly1,echo=FALSE----------------------------------------------------
set.seed(425)  # make sure we are reproducible

## ----poly,fig.dim=c(4,4)-------------------------------------------------
r <- runif(20)
r <- r/sum(r)
f <- function(x) 1/mean(log1p(r*x))
knots <- matrix(runif(60000), 20)
phs <- ipol(f, knots=knots, k=3, method='polyharmonic')
rr <- runif(20)
curve <- function(x) abs(cos(5*pi*rr*x))
s <- seq(0,1,length.out=1000)
plot(s,sapply(s,function(x) f(curve(x))),typ='l')
lines(s,sapply(s,function(x) phs(curve(x))),col='blue',lty=2)

