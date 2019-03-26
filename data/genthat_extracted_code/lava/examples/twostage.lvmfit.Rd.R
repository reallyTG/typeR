library(lava)


### Name: twostage.lvmfit
### Title: Two-stage estimator (non-linear SEM)
### Aliases: twostage.lvmfit twostage.lvm twostage.lvm.mixture
###   twostage.estimate nonlinear nonlinear<-

### ** Examples

m <- lvm(c(x1,x2,x3)~f1,f1~z,
         c(y1,y2,y3)~f2,f2~f1+z)
latent(m) <- ~f1+f2
d <- simulate(m,100,p=c("f2,f2"=2,"f1,f1"=0.5),seed=1)

## Full MLE
ee <- estimate(m,d)

## Manual two-stage
## Not run: 
##D m1 <- lvm(c(x1,x2,x3)~f1,f1~z); latent(m1) <- ~f1
##D e1 <- estimate(m1,d)
##D pp1 <- predict(e1,f1~x1+x2+x3)
##D 
##D d$u1 <- pp1[,]
##D d$u2 <- pp1[,]^2+attr(pp1,"cond.var")[1]
##D m2 <- lvm(c(y1,y2,y3)~eta,c(y1,eta)~u1+u2+z); latent(m2) <- ~eta
##D e2 <- estimate(m2,d)
## End(Not run)

## Two-stage
m1 <- lvm(c(x1,x2,x3)~f1,f1~z); latent(m1) <- ~f1
m2 <- lvm(c(y1,y2,y3)~eta,c(y1,eta)~u1+u2+z); latent(m2) <- ~eta
pred <- function(mu,var,data,...)
    cbind("u1"=mu[,1],"u2"=mu[,1]^2+var[1])
(mm <- twostage(m1,model2=m2,data=d,predict.fun=pred))

if (interactive()) {
    pf <- function(p) p["eta"]+p["eta~u1"]*u + p["eta~u2"]*u^2
    plot(mm,f=pf,data=data.frame(u=seq(-2,2,length.out=100)),lwd=2)
}

## Splines
f <- function(x) cos(2*x)+x+-0.25*x^2
m <- lvm(x1+x2+x3~eta1, y1+y2+y3~eta2, latent=~eta1+eta2)
functional(m, eta2~eta1) <- f
d <- sim(m,500,seed=1,latent=TRUE)
m1 <- lvm(x1+x2+x3~eta1,latent=~eta1)
m2 <- lvm(y1+y2+y3~eta2,latent=~eta2)
mm <- twostage(m1,m2,formula=eta2~eta1,type="spline")
if (interactive()) plot(mm)

nonlinear(m2,type="quadratic") <- eta2~eta1
a <- twostage(m1,m2,data=d)
if (interactive()) plot(a)

kn <- c(-1,0,1)
nonlinear(m2,type="spline",knots=kn) <- eta2~eta1
a <- twostage(m1,m2,data=d)
x <- seq(-3,3,by=0.1)
y <- predict(a, newdata=data.frame(eta1=x))

if (interactive()) {
  plot(eta2~eta1, data=d)
  lines(x,y, col="red", lwd=5)

  p <- estimate(a,f=function(p) predict(a,p=p,newdata=x))$coefmat
  plot(eta2~eta1, data=d)
  lines(x,p[,1], col="red", lwd=5)
  confband(x,lower=p[,3],upper=p[,4],center=p[,1], polygon=TRUE, col=Col(2,0.2))

  l1 <- lm(eta2~splines::ns(eta1,knots=kn),data=d)
  p1 <- predict(l1,newdata=data.frame(eta1=x),interval="confidence")
  lines(x,p1[,1],col="green",lwd=5)
  confband(x,lower=p1[,2],upper=p1[,3],center=p1[,1], polygon=TRUE, col=Col(3,0.2))
}

## Not run: 
##D  ## Reduce timing
##D  ## Cross-validation example
##D  ma <- lvm(c(x1,x2,x3)~u,latent=~u)
##D  ms <- functional(ma, y~u, f=function(x) -.4*x^2)
##D  d <- sim(ms,500)#,seed=1)
##D  ea <- estimate(ma,d)
##D 
##D  mb <- lvm()
##D  mb1 <- nonlinear(mb,type="linear",y~u)
##D  mb2 <- nonlinear(mb,type="quadratic",y~u)
##D  mb3 <- nonlinear(mb,type="spline",knots=c(-3,-1,0,1,3),y~u)
##D  mb4 <- nonlinear(mb,type="spline",knots=c(-3,-2,-1,0,1,2,3),y~u)
##D  ff <- lapply(list(mb1,mb2,mb3,mb4),
##D       function(m) function(data,...) twostage(ma,m,data=data,st.derr=FALSE))
##D  a <- cv(ff,data=d,rep=1,mc.cores=1)
##D  a
## End(Not run)



