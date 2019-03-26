library(robeth)


### Name: robeth-package
### Title: Interface for the FORTRAN programs developed at the ETH-Zuerich
###   and then at IUMSP-Lausanne
### Aliases: robeth-package robeth
### Keywords: package robust

### ** Examples

library(robeth)

#
# ------------- Examples of Chapter 1: Location problems ------------------------------
#
 y  <- c(6.0,7.0,5.0,10.5,8.5,3.5,6.1,4.0,4.6,4.5,5.9,6.5)
 n  <- 12
 dfvals()
#-----------------------------------------------------------------------
# M-estimate (tm) of location and confidence interval (tl,tu)
#
 dfrpar(as.matrix(y),"huber")
 libeth()
 s  <- lilars(y);  t0 <- s$theta;  s0 <- s$sigma
 s  <- lyhalg(y=y,theta=t0,sigmai=s0)
 tm <- s$theta;    vartm <- s$var
 s  <- quant(0.975)
 tl <- tm-s$x*sqrt(vartm)
 tu <- tm+s$x*sqrt(vartm)
#-----------------------------------------------------------------------
# Hodges and Lehmann estimate (th) and confidence interval (zl,zu)
# 
 m  <- n*(n+1)/2 # n even
 k1 <- m/2; k2 <- k1+1
 z1 <- lyhdle(y=y,k=k1);   z2 <- lyhdle(y=y,k=k2)
 th <- (z1$hdle+z2$hdle)/2.
 ku <- liindh(0.95,n);     kl <- liindh(0.05,n)
 zu <- lyhdle(y=y,k=ku$k); zl <- lyhdle(y=y,k=kl$k)
#.......................................................................
{
 cat(" tm, tl, tu : ",round(c(tm,tl,tu),3),"\n")
 cat(" th, zl, zu : ",round(c(th,zl$hdle,zu$hdle),3),"\n")
}
#  tm, tl, tu : 5.809 4.748 6.87 
#  th, zl, zu : 5.85 5 7 
#=======================================================================
#
# Two sample problem
#
 y <- c(17.9,13.3,10.6,7.6,5.7,5.6,5.4,3.3,3.1,0.9)
 n <- 10
 x <- c(7.7,5.0,1.7,0.0,-3.0,-3.1,-10.5)
 m <- 7
#-----------------------------------------------------------------------
# Estimate (dm) and confidence interval [dl,du] based on Mann-Whitney
#
 k1 <- m*n/2;  k2 <- k1+1
 s1 <- lymnwt(x=x,y=y,k=k1);       s2 <- lymnwt(x=x,y=y,k=k2)
 dm <- (s1$tmnwt+s2$tmnwt)/2.0
 sl <- liindw(0.05,m,n);           kl <- sl$k
 s  <- lymnwt(x=x,y=y,k=kl);       dl <- s$tmnwt
 s  <- lymnwt(x=x,y=y,k=m*n-kl+1); du <- s$tmnwt
#-----------------------------------------------------------------------
# Tau-test . P-value (P)
#
 z <- c(x,y)
 dfrpar(as.matrix(z),"huber")
 libeth()
 s <- lytau2(z=z,m=m,n=n)    
 P <- s$p
#
# estimate (tm) and confidence interval (tl,tu)
#
 tm <- s$deltal
 c22<- s$cov[3]
 s  <- quant(0.975)
 tl <- tm-s$x*sqrt(c22)
 tu <- tm+s$x*sqrt(c22)
#.......................................................................
{
 cat("dm, dl, du:",round(c(dm,dl,du),3),"\n")
 cat("P, tm, tl, tu:",round(c(P,tm,tl,tu),3),"\n")
}
# dm, dl, du: 6.35 2.9 12.9 
# P, tm, tl, tu: 0.014 6.918 1.562 12.273 

#
# Examples of Chapter 2: M-estimates of coefficients and scale in linear regression
#
# Read data; declare the vector wgt; load defaults
#
 z <- c(-1, -2,  0,   35,         1,  0, -3,   20, 
        -1, -2,  0,   30,         1,  0, -3,   39,
        -1, -2,  0,   24,         1,  0, -3,   16,
        -1, -2,  0,   37,         1,  0, -3,   27,
        -1, -2,  0,   28,         1,  0, -3,  -12,
        -1, -2,  0,   73,         1,  0, -3,    2,
        -1, -2,  0,   31,         1,  0, -3,   31,
        -1, -2,  0,   21,         1,  0, -1,   26,
        -1, -2,  0,   -5,         1,  0, -1,   60,
        -1,  0,  0,   62,         1,  0, -1,   48,
        -1,  0,  0,   67,         1,  0, -1,   -8,
        -1,  0,  0,   95,         1,  0, -1,   46,
        -1,  0,  0,   62,         1,  0, -1,   77,
        -1,  0,  0,   54,         1,  0,  1,   57,
        -1,  0,  0,   56,         1,  0,  1,   89,
        -1,  0,  0,   48,         1,  0,  1,  103,
        -1,  0,  0,   70,         1,  0,  1,  129,
        -1,  0,  0,   94,         1,  0,  1,  139,
        -1,  0,  0,   42,         1,  0,  1,  128,
        -1,  2,  0,  116,         1,  0,  1,   89,
        -1,  2,  0,  105,         1,  0,  1,   86,
        -1,  2,  0,   91,         1,  0,  3,  140,
        -1,  2,  0,   94,         1,  0,  3,  133,
        -1,  2,  0,  130,         1,  0,  3,  142,
        -1,  2,  0,   79,         1,  0,  3,  118,
        -1,  2,  0,  120,         1,  0,  3,  137,
        -1,  2,  0,  124,         1,  0,  3,   84,
        -1,  2,  0,   -8,         1,  0,  3,  101)
  xx    <- matrix(z,ncol=4, byrow=TRUE)
  dimnames(xx) <- list(NULL,c("z2","xS","xT","y"))
  z2    <- xx[,"z2"]; xS <- xx[,"xS"]; xT <- xx[,"xT"]
  x     <- cbind(1, z2, xS+xT, xS-xT, xS^2+xT^2, xS^2-xT^2, xT^3)
  y     <- xx[,"y"]
  wgt   <- vector("numeric",length(y))
  n     <- 56; np <- 7
  dfvals()
# Set parameters for Huber estimate
  dfrpar(x, "huber")
# Compute the constants beta, bet0, epsi2 and epsip
  ribeth(wgt)
  ribet0(wgt)
  s     <- liepsh()
  epsi2 <- s$epsi2;    epsip <- s$epsip
#
# Least squares solution (theta0,sigma0)
#
  z     <- riclls(x, y)
  theta0<- z$theta; sigma0 <- z$sigma
# Preliminary estimate of the covariance matrix of the coefficients
  cv    <- kiascv(z$xt, fu=epsi2/epsip^2, fb=0.)
  cov   <- cv$cov
#-----------------------------------------------------------------------
# Solution (theta1,sigma1) by means of RYHALG.
#
  zr    <- ryhalg(x,y,theta0,wgt,cov,sigmai=sigma0,ic=0)
  theta1<- zr$theta[1:np]; sigma1 <- zr$sigmaf; nit1 <- zr$nit
#-----------------------------------------------------------------------
# Solution (theta2,sigma2) by means of RYWALG (recompute cov) 
#
  cv <- ktaskv(x, f=epsi2/epsip^2)
  zr <- rywalg(x, y, theta0, wgt, cv$cov, sigmai=sigma0)
  theta2 <- zr$theta[1:np]; sigma2 <- zr$sigmaf; nit2 <- zr$nit
#-----------------------------------------------------------------------
# Solution (theta3,sigma3) by means of RYSALG with ISIGMA=2.
#
  zr <- rysalg(x,y, theta0, wgt, cv$cov, sigma0, isigma=2)
  theta3 <- zr$theta[1:np]; sigma3 <- zr$sigmaf; nit3 <- zr$nit
#-----------------------------------------------------------------------
# Solution (theta4,sigma4) by means of RYNALG with ICNV=2 and ISIGMA=0.
#
# Invert cov
  covm1 <- cv$cov
  zc <- mchl(covm1,np)
  zc <- minv(zc$a, np)
  zc <- mtt1(zc$r,np)
  covm1 <- zc$b
  zr <- rynalg(x,y, theta0, wgt, covm1, sigmai=sigma3,
        iopt=1, isigma=0, icnv=2)
  theta4 <- zr$theta[1:np]; sigma4 <- zr$sigmaf; nit4 <- zr$nit
#.......................................................................
{
  cat("theta0 : ",round(theta0[1:np],3),"\n")
  cat("sigma0 : ",round(sigma0,3),"\n")
  cat("theta1 : ",round(theta1,3),"\n")
  cat("sigma1, nit1 : ",round(sigma1,3),nit1,"\n")
  cat("theta2 : ",round(theta2,3),"\n")
  cat("sigma2, nit2 : ",round(sigma2,3),nit2,"\n")
  cat("theta3 : ",round(theta3,3),"\n")
  cat("sigma3, nit3 : ",round(sigma3,3),nit3,"\n")
  cat("theta4 : ",round(theta4,3),"\n")
  cat("sigma4, nit4 : ",round(sigma4,3),nit4,"\n")
}
# theta0 :  68.634 3.634 24.081 -8.053 -0.446 -0.179 -1.634 
# sigma0 :  26.635 
# theta1 :  70.006 5.006 24.742 -6.246 -0.079 0.434 -1.487 
# sigma1, nit1 :  23.564 7 
# theta2 :  70.006 5.006 24.742 -6.245 -0.079 0.434 -1.487 
# sigma2, nit2 :  23.563 7 
# theta3 :  69.993 5.002 24.766 -6.214 -0.055 0.44 -1.48 
# sigma3, nit3 :  22.249 3 
# theta4 :  69.993 5.002 24.766 -6.214 -0.055 0.44 -1.48 
# sigma4, nit4 :  22.249 3 


#
# ---- Examples of Chapter 3: Weights for bounded influence regression ------
#

#=======================================================================
 rbmost <- function(x,y,cc,usext=userfd) {
 n      <- nrow(x); np <- ncol(x); dfcomn(xk=np)
 .dFvPut(1,"itw")
 z      <- wimedv(x)
 z      <- wyfalg(x, z$a, y, exu=usext); nitw <- z$nit
 wgt    <- 1/z$dist; wgt[wgt>1.e6] <- 1.e6
 z      <- comval()
 bto    <- z$bt0;    ipso   <- z$ipsi; co <- z$c
 z      <- ribet0(wgt, itype=2, isqw=0)
 xt     <- x*wgt;    yt     <- y * wgt
 z      <- rilars(xt, yt)
 theta0 <- z$theta;  sigma0 <- z$sigma
 rs     <- z$rs/wgt; r1     <- rs/sigma0 
 dfcomn(ipsi=1,c=cc)
 z      <- liepsh(cc)
 den    <- z$epsip
 g      <- Psp(r1)/den # (see Psi in Chpt. 14)
 dfcomn(ipsi=ipso, c=co, bet0=bto)
 list(theta=theta0, sigma=sigma0, rs=rs, g=g, nitw=nitw)
}
#-----------------------------------------------------------------------
# Mallows-standard estimate (with wyfalg and rywalg)
#
 Mal.Std <- function(x, y, b2=-1, cc=-1, isigma=2) {
 n <- length(y); np <- ncol(x)
 dfrpar(x, "Mal-Std", b2, cc); .dFv <- .dFvGet()
 if (isigma==1) {dfcomn(d=.dFv$ccc); .dFvPut(1,"isg")}
# Weights 
 z      <- wimedv(x)
 z      <- wyfalg(x, z$a, y); nitw <- z$nit
 wgt    <- Www(z$dist)   # See Www in Chpt. 14
# Initial cov. matrix of coefficient estimates
 z      <- kiedch(wgt)
 cov    <- ktaskw(x, z$d, z$e, f=1/n)
# Initial theta and sigma
 z      <- rbmost(x,y,1.5,userfd)
 theta0 <- z$theta; sigma0 <- z$sigma; nitw0 <- z$nitw
# Final theta and sigma
 if (isigma==1) ribeth(wgt) else ribet0(wgt)
 z      <- rywalg(x, y,theta0,wgt,cov$cov, sigmai=sigma0)
 theta1 <- z$theta[1:np]; sigma1 <- z$sigmaf; nit1 <- z$nit
# Covariance matrix of coefficient estimates
 z      <- kfedcc(wgt, z$rs, sigma=sigma1)
 cov    <- ktaskw(x, z$d, z$e, f=(sigma1^2)/n)
 sd1    <- NULL; for (i in 1:np) { j <- i*(i+1)/2
 sd1    <- c(sd1,cov$cov[j]) }
 sd1    <- sqrt(sd1)
#.......................................................................
{
  cat("rbmost: theta0 : ",round(theta0[1:np],3),"\n")
  cat("rbmost: sigma0, nitw : ",round(sigma0,3),nitw0,"\n")
  cat("Mallows-Std: theta1 : ",round(theta1,3),"\n")
  cat("Mallows-Std: sd1    : ",round(sd1,3),"\n")
  cat("Mallows-Std: sigma1, nitw, nit1 : ",round(sigma1,3),nitw,nit1,"\n")
}

#.......................................................................
 list(theta0=theta0[1:np], sigma0=sigma0, nitw=nitw,
      theta1=theta1, sigma1=sigma1, nit1=nit1, sd1=sd1)}
#-----------------------------------------------------------------------
# Krasker-Welsch estimate (with wynalg and rynalg)
#
 Kra.Wel <- function(x, y, ckw=-1, isigma=2) {
 n <- length(y); np <- ncol(x)
 dfrpar(x, "Kra-Wel", ckw); .dFv <- .dFvGet()
 if (isigma==1) {dfcomn(d=.dFv$ccc); .dFvPut(1,"isg")}
# Weights 
 z      <- wimedv(x)
 z      <- wynalg(x, z$a); nitw <- z$nit
 wgt    <- Www(z$dist)  # See Www in Chpt. 14
# Initial cov. matrix of coefficient estimates
 z      <- kiedch(wgt)
 cov    <- ktaskw(x, z$d, z$e, f=1/n)
# Initial theta and sigma
 z      <- rbmost(x, y, cc=1.5)
 theta0 <- z$theta;       sigma0 <- z$sigma; nitw0 <- z$nitw
# Final theta and sigma
  if (isigma==1) ribeth(wgt) else ribet0(wgt)
 z      <- rynalg(x, y,theta0,wgt,cov$cov, sigmai=sigma0)
 theta2 <- z$theta[1:np]; sigma2 <- z$sigma; nit2 <- z$nit
#
# Covariance matrix of coefficient estimates
#
 z      <- kfedcc(wgt, z$rs, sigma=sigma2)
 cov    <- ktaskw(x, z$d, z$e, f=(sigma2^2)/n)
 sd2    <- NULL; for (i in 1:np) { j <- i*(i+1)/2
 sd2    <- c(sd2,cov$cov[j]) }
 sd2    <- sqrt(sd2)
#.......................................................................
{
  cat("rbmost: theta0 : ",round(theta0[1:np],3),"\n")
  cat("rbmost: sigma0, nitw : ",round(sigma0,3),nitw0,"\n")
  cat("Krasker-Welsch: theta2 : ",round(theta2,3),"\n")
  cat("Krasker-Welsch: sd2    : ",round(sd2,3),"\n")
  cat("Krasker-Welsch: sigma2, nitw, nit2 : ",round(sigma2,3),nitw,nit2,"\n")
}
#.......................................................................
 list(theta0=theta0[1:np], sigma0=sigma0, nitw=nitw,
      theta2=theta2, sigma2=sigma2, nit2=nit2, sd2=sd2)}
#-----------------------------------------------------------------------
# Read data; load defaults
# 
  z <- c( 8.2,  4, 23.005,  1,   7.6,  5, 23.873,  1,
          4.6,  0, 26.417,  1,   4.3,  1, 24.868,  1,
          5.9,  2, 29.895,  1,   5.0,  3, 24.200,  1,
          6.5,  4, 23.215,  1,   8.3,  5, 21.862,  1,
         10.1,  0, 22.274,  1,  13.2,  1, 23.830,  1,
         12.6,  2, 25.144,  1,  10.4,  3, 22.430,  1,
         10.8,  4, 21.785,  1,  13.1,  5, 22.380,  1,
         13.3,  0, 23.927,  1,  10.4,  1, 33.443,  1,
         10.5,  2, 24.859,  1,   7.7,  3, 22.686,  1,
         10.0,  0, 21.789,  1,  12.0,  1, 22.041,  1,
         12.1,  4, 21.033,  1,  13.6,  5, 21.005,  1,
         15.0,  0, 25.865,  1,  13.5,  1, 26.290,  1,
         11.5,  2, 22.932,  1,  12.0,  3, 21.313,  1,
         13.0,  4, 20.769,  1,  14.1,  5, 21.393,  1)
 x      <- matrix(z, ncol=4, byrow=TRUE)
 y      <- c( 7.6,  7.7,  4.3,  5.9,  5.0,  6.5,  8.3,  8.2, 13.2, 12.6,
             10.4, 10.8, 13.1, 12.3, 10.4, 10.5,  7.7,  9.5, 12.0, 12.6,
             13.6, 14.1, 13.5, 11.5, 12.0, 13.0, 14.1, 15.1)
 dfvals()
 dfcomn(xk=4)
 cat("Results\n")
 z1     <- Mal.Std(x, y)
 z2     <- Kra.Wel(x, y)


#
# ---- Examples of Chapter 4: Covariance matrix of the coefficient estimates ------
#

#
# Read x[1:4] and then set x[,4] <- 1
# 
 z     <- c(80, 27, 89, 1,   80, 27, 88, 1,   75, 25, 90, 1,
            62, 24, 87, 1,   62, 22, 87, 1,   62, 23, 87, 1,
            62, 24, 93, 1,   62, 24, 93, 1,   58, 23, 87, 1,
            58, 18, 80, 1,   58, 18, 89, 1,   58, 17, 88, 1,
            58, 18, 82, 1,   58, 19, 93, 1,   50, 18, 89, 1,
            50, 18, 86, 1,   50, 19, 72, 1,   50, 19, 79, 1,
            50, 20, 80, 1,   56, 20, 82, 1,   70, 20, 91, 1)
 x     <- matrix(z, ncol=4, byrow=TRUE)
 n     <- 21; np <- 4; ncov <- np*(np+1)/2
 dfvals()
# Cov. matrix of Huber-type estimates
 dfrpar(x, "huber")
 s     <- liepsh()
 epsi2 <- s$epsi2; epsip <- s$epsip
 z     <- rimtrf(x)
 xt    <- z$x; sg <- z$sg; ip <- z$ip
 zc    <- kiascv(xt, fu=epsi2/epsip^2, fb=0.)
 covi  <- zc$cov  # Can be used in ryhalg with ic=0
 zc    <- kfascv(xt, covi, f=1, sg=sg, ip=ip)
 covf  <- zc$cov
#.......................................................................
  str <- rep("  ", ncov); str[cumsum(1:np)] <- "\n"
{
  cat("covf:\n")
  cat(round(covf,6),sep=str)
}


#
# ---- Examples of Chapter 5: Asymptotic relative efficiency ------
#
#-----------------------------------------------------------------------
# Huber
#
    dfcomn(ipsi=1,c=1.345,d=1.345)
    .dFvPut(1,"ite")
    z <- airef0(mu=3, ialfa=1, sigmx=1)
#.......................................................................
{
   cat(" airef0 : Huber\n reff, alfa, beta, nit: ")
   cat(round(c(z$reff,z$alfa,z$beta,z$nit),3),sep=c(", ",", ",", ","\n"))
}
#-----------------------------------------------------------------------
# Schweppe: Krasker-Welsch
#
    dfcomn(ipsi=1,c=3.76,iucv=3,ckw=3.76,iwww=1)
    .dFvPut(3,"ite")
    z <- airef0(mu=3, ialfa=1, sigmx=1)
#.......................................................................
{
   cat(" airef0 : Krasker-Welsch\n reff, alfa, beta, nit: ")
   cat(round(c(z$reff,z$alfa,z$beta,z$nit),3),sep=c(", ",", ",", ","\n"))
}
#-----------------------------------------------------------------------
# Mallows-Standard
#
    dfcomn(ipsi=1,c=1.5,iucv=1,a2=0,b2=6.16,iww=3)
    .dFvPut(2,"ite")
    z <- airef0(mu=3, ialfa=1, sigmx=1)
#.......................................................................
{
   cat(" airef0 : Mallows-Std \n reff, alfa, beta, nit: ")
   cat(round(c(z$reff,z$alfa,z$beta,z$nit),3),sep=c(", ",", ",", ","\n"))
}
#=======================================================================
 z <- c(1, 0, 0,
        1, 0, 0,
        1, 0, 0,
        1, 0, 0,
        0, 1, 0,
        0, 1, 0,
        0, 1, 0,
        0, 1, 0,
        0, 0, 1,
        0, 0, 1,
        0, 0, 1,
        0, 0, 1)
 tt <- matrix(z,ncol=3,byrow=TRUE)
 n <- nrow(tt); mu <- 2
 nu <- ncol(tt)

#-----------------------------------------------------------------------
# Huber
#
    dfrpar(tt,"Huber")
    z <- airefq(tt, mu=mu, sigmx=1)
#.......................................................................
{
   cat(" airefq : Huber\n reff, beta, nit: ")
   cat(round(c(z$reff,z$beta,z$nit),3),sep=c(", ",", ",", ","\n"))
}
#-----------------------------------------------------------------------
# Krasker-Welsch
#
    dfrpar(tt,"kra-wel",upar=3.755)
    z <- airefq(tt, mu=mu, sigmx=1,init=1)
#.......................................................................
{
   cat(" airefq : Krasker-Welsch\n reff, beta, nit: ")
   cat(round(c(z$reff,z$beta,z$nit),3),sep=c(", ",", ",", ","\n"))
}
#-----------------------------------------------------------------------
# Mallows Standard
#
    dfrpar(tt,"Mal-Std",1.1*(mu+nu),1.569)
    z <- airefq(tt, mu=mu, sigmx=1,init=1)
#.......................................................................
{
   cat(" airefq : Mallows-Std\n reff, beta, nit: ")
   cat(round(c(z$reff,z$beta,z$nit),3),sep=c(", ",", ",", ","\n"))
}



#
# ---- Examples of Chapter 6: Robust testing in linear models ------
#

#=======================================================================
 tautest <- function(x,y,np,nq) {
# Full model. np variables in x[,1:np]
 n      <- nrow(x)
 z      <- riclls(x[,1:np], y)
 theta0 <- z$theta; sigma0 <- z$sigma; .dFv <- .dFvGet() 
 z      <- liepsh(.dFv$ccc) # ccc is globally defined by dfrpar
 epsi2  <- z$epsi2; epsip <- z$epsip
 zc     <- ktaskv(x[,1:np],f=epsi2/(epsip^2))
 covi   <- zc$cov
 ribeth(y) 
 zf     <- rywalg(x[,1:np],y,theta0,y,covi,sigmai=sigma0)
 thetaf <- zf$theta; sigma <- zf$sigmaf; rf <- zf$rs
 f      <- kffacv(rf,np=np,sigma=sigma)
 zc     <- ktaskv(x[,1:np],f=f$fh*(sigma^2)/n)
 cov    <- zc$cov
# Sub-model: nq variables in x[,1:nq], nq < np
 covi   <- cov[1:(nq*(nq+1)/2)]
 zs     <- rywalg(x[,1:nq], y, thetaf, y, covi, sigmai=sigma,isigma=0)
 thetas <- zs$theta; rs <- zs$rs
# Compute Tau-test statistic and P-value
 ztau   <- tftaut(rf,rs,y,rho,np,nq,sigma)
 ftau   <- ztau$ftau
 z      <- chisq(1,np-nq,ftau*epsip/epsi2)
 P      <- 1-z$p
#.......................................................................
{
 cat(" F_tau, P, sigma: ")
 cat(round(c(ftau,P,sigma),3),sep=c(", ",", ","\n"))
 cat(" theta (small model): ",round(thetas[1:nq],3),"\n\n")
}
#.......................................................................
 list(thetas=thetas[1:nq], sigma=sigma, rs=rs,ftau=ftau, P=P)}
#------------------------------------------------------------------------
 dshift <- function(x, theta, sigma, rs, nq) {
# Shift estimate d and confidence interval
 ncov   <- nq*(nq+1)/2
 f      <- kffacv(rs,np=nq,sigma=sigma)
 zc     <- ktaskv(x[,1:nq],f=f$fh)
 cov    <- zc$cov
 k11    <- 4.*cov[ncov-nq]
 k12    <- 2.*cov[ncov-1]
 k22    <- cov[ncov]
 za     <- quant(0.05/2)
 d      <- 2*theta[nq-1]/theta[nq]
 q      <- za$x*sigma/theta[nq]
 g      <- k22*(q^2)
 a      <- d-g*k12/k22
 b      <- abs(q)*sqrt(k11-2*d*k12+d*d*k22-g*(k11-k12*k12/k22))
 dL     <- (a-b)/(1-g)
 dU     <- (a+b)/(1-g)
#.......................................................................
 cat(" d, dL, dU: ",round(c(d,dL,dU),3),sep=c("",", ",", ","\n"))
#.......................................................................
 list(d=d, dL=dL, dU=dU)
}
#------------------------------------------------------------------------
 potcy  <- function(m,ml,mu,h,k,d,cs,ct) {
 fact   <- ((h*k) %% 2) + 1
 r      <- exp(log(d)*(fact*m+h-k)/2 - log(ct/cs))
 rl     <- exp(log(d)*(fact*ml+h-k)/2 - log(ct/cs))
 ru     <- exp(log(d)*(fact*mu+h-k)/2 - log(ct/cs))
 list(R=r, Rl=rl, Ru=ru)}
#------------------------------------------------------------------------
 rbmost <- function(x,y,cc,usext=userfd) {
 n      <- nrow(x); np <- ncol(x); dfcomn(xk=np)
 .dFvPut(1,"itw")
 z      <- wimedv(x)
 z      <- wyfalg(x, z$a, y, exu=usext); nitw <- z$nit
 wgt    <- 1/z$dist; wgt[wgt>1.e6] <- 1.e6
 z      <- comval()
 bto    <- z$bt0;    ipso   <- z$ipsi; co <- z$c
 z      <- ribet0(wgt, itype=2, isqw=0)
 xt     <- x*wgt;    yt     <- y * wgt
 z      <- rilars(xt, yt)
 theta0 <- z$theta;  sigma0 <- z$sigma
 rs     <- z$rs/wgt; r1     <- rs/sigma0 
 dfcomn(ipsi=1,c=cc)
 z      <- liepsh(cc)
 den    <- z$epsip
 g      <- Psp(r1)/den # (see Psp in Chpt. 14)
 dfcomn(ipsi=ipso, c=co, bet0=bto)
 list(theta=theta0, sigma=sigma0, rs=rs, g=g, nitw=nitw)
}
#=======================================================================
 dfvals()
 z <- c(-1, -2,  0,   35,         1,  0, -3,   20, 
        -1, -2,  0,   30,         1,  0, -3,   39,
        -1, -2,  0,   24,         1,  0, -3,   16,
        -1, -2,  0,   37,         1,  0, -3,   27,
        -1, -2,  0,   28,         1,  0, -3,  -12,
        -1, -2,  0,   73,         1,  0, -3,    2,
        -1, -2,  0,   31,         1,  0, -3,   31,
        -1, -2,  0,   21,         1,  0, -1,   26,
        -1, -2,  0,   -5,         1,  0, -1,   60,
        -1,  0,  0,   62,         1,  0, -1,   48,
        -1,  0,  0,   67,         1,  0, -1,   -8,
        -1,  0,  0,   95,         1,  0, -1,   46,
        -1,  0,  0,   62,         1,  0, -1,   77,
        -1,  0,  0,   54,         1,  0,  1,   57,
        -1,  0,  0,   56,         1,  0,  1,   89,
        -1,  0,  0,   48,         1,  0,  1,  103,
        -1,  0,  0,   70,         1,  0,  1,  129,
        -1,  0,  0,   94,         1,  0,  1,  139,
        -1,  0,  0,   42,         1,  0,  1,  128,
        -1,  2,  0,  116,         1,  0,  1,   89,
        -1,  2,  0,  105,         1,  0,  1,   86,
        -1,  2,  0,   91,         1,  0,  3,  140,
        -1,  2,  0,   94,         1,  0,  3,  133,
        -1,  2,  0,  130,         1,  0,  3,  142,
        -1,  2,  0,   79,         1,  0,  3,  118,
        -1,  2,  0,  120,         1,  0,  3,  137,
        -1,  2,  0,  124,         1,  0,  3,   84,
        -1,  2,  0,   -8,         1,  0,  3,  101)
  xx    <- matrix(z,ncol=4, byrow=TRUE)
  dimnames(xx) <- list(NULL,c("z2","xS","xT","y"))
  z2    <- xx[,"z2"]; xS <- xx[,"xS"]; xT <- xx[,"xT"]
  x     <- cbind(1, z2, xS+xT, xS-xT, xS^2+xT^2, xS^2-xT^2, xT^3)
  y     <- xx[,"y"]
  z     <- dfrpar(x, "huber",psipar=1.345)
#
#  Tau-test  and  shift estimate
#
{ 
  cat("Results (linearity test)\n")
  np    <- 7;   nq <- 4   # Test linearity
  z     <- tautest(x,y,np,nq)
  cat("Results (parallelism test)\n")
  np    <- 4;   nq <- 3  # Test parallelism
  z     <- tautest(x,y,np,nq)
  z     <- dshift(x, z$thetas, z$sigma, z$rs, nq)
}
#------------------------------------------------------------------------
# Input data; set defaults
# 
  z <- c(35.3,  20,  10.98,
         29.7,  20,  11.13,
         30.8,  23,  12.51,
         58.8,  20,   8.40,
         61.4,  21,   9.27,
         71.3,  22,   8.73,
         74.4,  11,   6.36,
         76.7,  23,   8.50,
         70.7,  21,   7.82,
         57.5,  20,   9.14,
         46.4,  20,   8.24,
         28.9,  21,  12.19,
         28.1,  21,  11.88,
         39.1,  19,   9.57,
         46.8,  23,  10.94,
         48.5,  20,   9.58,
         59.3,  22,  10.09,
         70.0,  22,   8.11,
         70.0,  11,   6.83,
         74.5,  23,   8.88,
         72.1,  20,   7.68,
         58.1,  21,   8.47,
         44.6,  20,   8.86,
         33.4,  20,  10.36,
         28.6,  22,  11.08)
 x      <- matrix(z, ncol=3, byrow=TRUE)
 y      <- x[,3]; x[,2:3] <- x[,1:2]; x[,1] <- 1
 n      <- length(y); np <- ncol(x); nq <- np - 1
#
# Optimal tau-test based on Schweppe-type estimates
#
 z      <- tauare(itype=3,mu=1,cpsi=2.665,bb=0,sigmax=1)
 dfrpar(x, "Sch-Tau",upar=2.67); .dFvPut(1,"isg"); 
 .dFv   <- .dFvGet(); dfcomn(d=.dFv$ccc)
# Full model: initial estimates of theta, sigma and weights
 dfcomn(xk=np)  # Needed for userfd 
 zr     <- rbmost(x,y,cc=1.5)
 theta0 <- zr$theta; sigma0 <- zr$sigma; nitw0 <- zr$nitw 
#
# Initial and final values of weights 
#
 z      <- wimedv(x)
 z      <- wyfalg(x, z$a, zr$g, nvarq=nq, igwt=1)
 wgt    <- 1/z$dist ; wgt[wgt>1.e6] <- 1.e6
# Full model: covariance matrix of coefficients and inverse
 z      <- kiedch(wgt)
 zc     <- ktaskw(x, z$d, z$e, f=1/n, iainv=1)
 cov    <- zc$cov; ainv <- zc$ainv
# Full model: Final estimate of theta and sigma
 ribeth(wgt)
 zf     <- rywalg(x, y,theta0,wgt,cov, sigmai=sigma0)
 thetaf <- zf$theta[1:np]; sigma <- zf$sigmaf; nitf <- zf$nit
# Small model: Final estimate of theta and sigma
 covi   <- cov[1:(nq*(nq+1)/2)]
 xt     <- x[,1:nq,drop=FALSE]
 zs     <- rywalg(xt, y, theta0, wgt, covi, sigmai=sigma, isigma=0)
 thetas <- zs$theta[1:nq]; nits <- zs$nit
# Compute Tau-test statistic
 ft     <- tftaut(zf$rs,zs$rs,wgt,rho,np,nq,sigma)
 ftau   <- ft$ftau
# P-value
 z      <- ttaskt(cov, ainv, np, nq, fact=n)
 z      <- tteign(z$covtau,nq)
 xlmbda <- z$xlmbda[1:(np-nq)]
 mult   <- rep(1, length=np)
 delta  <- rep(0, length=np)
 z      <- ruben(xlmbda, delta, mult,ftau, xmode=-1, maxit=100, eps=0.0001)
 P      <- 1-z$cumdf
#.......................................................................
{
 cat(" Optimal Tau-test : Schweppe-type estimates\n")
 cat(" theta0: ",round(theta0[1:np],3),"\n sigma0, nitw: ")
 cat(round(c(sigma0,nitw0),3),sep=c(", ","\n"))
 cat(" thetaf: ",round(thetaf,3),"\n sigma, nit: ")
 cat(round(c(sigma,nitf),3),sep=c(", ","\n"))
 cat(" thetas: ",round(thetas,3),"\n sigma, nit: ")
 cat(round(c(sigma,nits),3),sep=c(", ","\n"))
 cat(" F_tau =",round(ftau,3),", P =",P,"\n")
}
#=======================================================================
 rn2mal <- function(x,y,b2,c,nq) {
 n <- length(y); np <- ncol(x)
#
#  Rn2-test on Mallows estimators 
#  ==============================
 dfrpar(x, "mal-std", b2, c)
 .dFvPut(1,"isg"); .dFv <- .dFvGet(); dfcomn(d=.dFv$ccc)
#
# Initial and final values of weights
#
 z     <- wimedv(x)
 z     <- wyfalg(x, z$a, wgt)
 wgt   <- Www(z$dist); nitw <- z$nit
#
# Initial theta and sigma (using weighted LAR)
#
 ribet0(wgt, isqw=0)
 xt    <- x*wgt
 yt    <- y * wgt
 z     <- rilars(xt, yt)
 theta0 <- z$theta; sigma0 <- z$sigma
#
# Initial value of COV
#
 z     <- kiedch(wgt)
 zc    <- ktaskw(x, z$d, z$e, f=1/n)
 covi  <- zc$cov 
#
# Solution by means of RYWALG. 
#
 z     <- ribeth(wgt)
 beta  <- z$bta
 zw    <- rywalg(x, y, theta0, wgt, covi, sigmai=sigma0)
 theta1 <- zw$theta[1:np]; sigma1 <- zw$sigmaf; nit1 <- zw$nit
#
# Unscaled covariance matrix of coefficients
#
  zc   <- kfedcb(wgt, zw$rs, sigma=sigma1)
  z    <- ktaskw(x, zc$d, zc$e, f=1/n)
  cov1 <- z$cov
#
# Rn2-test statistic and significance
#
 z     <- tfrn2t(cov1,theta1,n,nq)
 rn2m  <- z$rn2t/(n*sigma1^2)
 z     <- chisq(1,np-nq,rn2m)
 p1    <- 1.-z$p
 list(theta1=theta1, sigma1=sigma1, wgt=wgt, nitw=nitw, nit1=nit1,
      rn2m=rn2m, p1=p1)}
#------------------------------------------------------------------------
#
# Read data
# 
  z <- c(35.3,  20,  10.98,
         29.7,  20,  11.13,
         30.8,  23,  12.51,
         58.8,  20,   8.40,
         61.4,  21,   9.27,
         71.3,  22,   8.73,
         74.4,  11,   6.36,
         76.7,  23,   8.50,
         70.7,  21,   7.82,
         57.5,  20,   9.14,
         46.4,  20,   8.24,
         28.9,  21,  12.19,
         28.1,  21,  11.88,
         39.1,  19,   9.57,
         46.8,  23,  10.94,
         48.5,  20,   9.58,
         59.3,  22,  10.09,
         70.0,  22,   8.11,
         70.0,  11,   6.83,
         74.5,  23,   8.88,
         72.1,  20,   7.68,
         58.1,  21,   8.47,
         44.6,  20,   8.86,
         33.4,  20,  10.36,
         28.6,  22,  11.08)
  x      <- matrix(z, ncol=3, byrow=TRUE)
  y      <- x[,3]; x[,2:3] <- x[,1:2];  x[,1] <- 1
  n      <- length(y); np <- ncol(x); nq <- np - 1
  wgt    <- vector("numeric",length(y))
  z      <- rn2mal(x, y, 4, 1.5, nq)
#.......................................................................
{
 cat("Rn2-test on Mallows estimators\n")
 cat(" theta1: ",round(z$theta1,3),"\n sigma1, nitw, nit1: ")
 cat(round(c(z$sigma1,z$nitw,z$nit1),3),sep=c(", ",", ","\n"))
 cat(" Rn2 =",round(z$rn2m,3),", P =",z$p1,"\n")
}


#
# ---- Examples of Chapter 7: Breakdown point regression ------
#

#
# Read data; load defaults
# 
  z <- c(80, 27, 89, 42, 
         80, 27, 88, 37, 
         75, 25, 90, 37, 
         62, 24, 87, 28,
         62, 22, 87, 18, 
         62, 23, 87, 18, 
         62, 24, 93, 19, 
         62, 24, 93, 20,
         58, 23, 87, 15, 
         58, 18, 80, 14, 
         58, 18, 89, 14, 
         58, 17, 88, 13,
         58, 18, 82, 11, 
         58, 19, 93, 12, 
         50, 18, 89,  8, 
         50, 18, 86,  7,
         50, 19, 72,  8, 
         50, 19, 79,  8, 
         50, 20, 80,  9, 
         56, 20, 82, 15,
         70, 20, 91, 15)
 x       <- matrix(z, ncol=4, byrow=TRUE)
 y       <- x[,4]; x[,4] <- 1
 n       <- length(y); np <- ncol(x)
 nq      <- np+1
 dfvals()
#
# Least median of squares
#
  zr     <- hylmse(x,y, nq, ik=1, iopt=3, intch=1)
  theta1 <- zr$theta; xmin1 <- zr$xmin
  zr     <- hylmse(x,y, nq, ik=2, iopt=3, intch=1)
  theta2 <- zr$theta; xmin2 <- zr$xmin
  zr     <- hylmse(x,y, nq, ik=1, iopt=1, intch=1)
  theta3 <- zr$theta; xmin3 <- zr$xmin

#
# Least trimmed squares
#
  zr     <- hyltse(x,y, nq, ik=1, iopt=3, intch=1)
  theta4 <- zr$theta; xmin4 <- zr$smin
  zr     <- hyltse(x,y, nq, ik=2, iopt=3, intch=1)
  theta5 <- zr$theta; xmin5 <- zr$smin
  zr     <- hyltse(x,y, nq, ik=1, iopt=1, intch=1)
  theta6 <- zr$theta; xmin6 <- zr$smin

#
# S-estimate
#
  z      <- dfrpar(x,'S')
  z      <- ribetu(y) 
  zr     <- hysest(x,y, nq, iopt=3, intch=1)
  theta7 <- zr$theta[1:np]; xmin7 <- zr$smin
  zr     <- hysest(x,y, nq, iopt=1, intch=1)
  theta8 <- zr$theta[1:np]; xmin8 <- zr$smin
#.......................................................................
{
  cat("Results\n theta1 = (")
  cat(round(theta1,3),sep=", ") 
  cat("), xmin1 ="); cat(round(xmin1,3))
  cat("\n theta2 = ("); cat(round(theta2,3),sep=", ") 
  cat("), xmin2 ="); cat(round(xmin2,3))
  cat("\n theta3 = ("); cat(round(theta3,3),sep=", ") 
  cat("), xmin3 ="); cat(round(xmin3,3))
  cat("\n theta4 = ("); cat(round(theta4,3),sep=", ") 
  cat("), xmin4 ="); cat(round(xmin4,3))
  cat("\n theta5 = ("); cat(round(theta5,3),sep=", ") 
  cat("), xmin5 ="); cat(round(xmin5,3))
  cat("\n theta6 = ("); cat(round(theta6,3),sep=", ") 
  cat("), xmin6 ="); cat(round(xmin6,3))
  cat("\n theta7 = ("); cat(round(theta7,3),sep=", ") 
  cat("), xmin7 ="); cat(round(xmin7,3))
  cat("\n theta8 = ("); cat(round(theta8,3),sep=", ") 
  cat("), xmin8 ="); cat(round(xmin8,3),"\n")
}

#
# ---- Examples of Chapter 8: M-estimates of covariance matrices ------
#

#
# Read data; set defaults
# 
  z <- c(4.37, 5.23,   4.38, 5.02,
         4.56, 5.74,   4.42, 4.66,
         4.26, 4.93,   4.29, 4.66,
         4.56, 5.74,   4.38, 4.90,
         4.30, 5.19,   4.22, 4.39,
         4.46, 5.46,   3.48, 6.05,
         3.84, 4.65,   4.38, 4.42,
         4.57, 5.27,   4.56, 5.10,
         4.26, 5.57,   4.45, 5.22,
         4.37, 5.12,   3.49, 6.29,
         3.49, 5.73,   4.23, 4.34,
         4.43, 5.45,   4.62, 5.62,
         4.48, 5.42,   4.53, 5.10,
         4.01, 4.05,   4.45, 5.22,
         4.29, 4.26,   4.53, 5.18,
         4.42, 4.58,   4.43, 5.57,
         4.23, 3.94,   4.38, 4.62,
         4.42, 4.18,   4.45, 5.06,
         4.23, 4.18,   4.50, 5.34,
         3.49, 5.89,   4.45, 5.34,
         4.29, 4.38,   4.55, 5.54,
         4.29, 4.22,   4.45, 4.98,
         4.42, 4.42,   4.42, 4.50,
         4.49, 4.85)
 cx      <- matrix(z, ncol=2, byrow=TRUE)
 n       <- nrow(cx); np <- ncol(cx)
 dst0    <- vector("numeric",n)
#-----------------------------------------------------------------------
# Classical covariance
#
  t0     <- apply(cx, 2, mean)
  xmb    <- sweep(cx, 2, t0)
  cv0    <- crossprod(xmb)/n
# Mahalanobis distances
  cvm1   <- solve(cv0)
  for (i in 1:n) {
      z  <- xmb[i,,drop=FALSE]; dst0[i] <- sqrt(z %*% cvm1 %*% t(z))}

#=======================================================================
# M-estimate of covariance
#
   zc    <- cicloc()
   za    <- cia2b2(nvar=np)
   a2    <- za$a2; b2 <- za$b2
   zd    <- cibeat(a2, b2, np)
   cw    <- zc$c;  dv <- zd$d
   dfcomn(iucv=1, a2=a2, b2=b2, bt=dv, cw=cw)
#  zf    <- cifact(a2,b2,np);  fc <- zf$fc
   z     <- cimedv(cx)
   ai    <- z$a; ti <- z$t; fc <- 1
#-----------------------------------------------------------------------
# With prescription F0
   zd    <- cyfalg(cx,ai,ti)
   zc    <- cfrcov(zd$a,np,fc)
   cv1   <- zc$cov; t1 <- zd$t; dst1 <- zd$dist; nt1 <- zd$nit
#-----------------------------------------------------------------------
# With prescription NH
   zd    <- cynalg(cx,ai,ti)
   zc    <- cfrcov(zd$a,np,fc)
   cv2   <- zc$cov; t2 <- zd$t; dst2 <- zd$dist; nt2 <- zd$nit
#-----------------------------------------------------------------------
# With prescription CG
   zd    <- cygalg(cx,ai,ti)
   zc    <- cfrcov(zd$a,np,fc)
   cv3   <- zc$cov; t3 <- zd$t; dst3 <- zd$dist; nt3 <- zd$nit
#.......................................................................
{
   cat("Results\n\n cv0[1,1],cv0[2,1],cv0[2,2] = (")
   cat(round(as.vector(cv0)[-2],3),sep=", ")
   cat(")\n t0 = ("); cat(round(t0,3),sep=", ")
   cat(")\n dist0 :\n ")
   cat(round(dst0,3),sep=c(rep(", ",9),",\n "))
   cat("\n cv1[1,1],cv1[2,1],cv1[2,2] = (")
   cat(round(cv1,3),sep=", ")
   cat(")\n t1 = ("); cat(round(t1,3),sep=", ") 
   cat("), nit1 =",nt1); cat("\n dist1 :\n ")
   cat(round(dst1,3),sep=c(rep(", ",9),",\n "))
   cat("\n cv2[1,1],cv2[2,1],cv2[2,2] = (")
   cat(round(cv2,3),sep=", ")
   cat(")\n t2 = ("); cat(round(t2,3),sep=", ") 
   cat("), nit2 =",nt2); cat("\n dist2 :\n ")
   cat(round(dst2,3),sep=c(rep(", ",9),",\n "))
   cat("\n cv3[1,1],cv3[2,1],cv3[2,2] = (")
   cat(round(cv3,3),sep=", ")
   cat(")\n t3 = ("); cat(round(t3,3),sep=", ") 
   cat("), nit3 =",nt3); cat("\n dist3 :\n ")
   cat(round(dst3,3),sep=c(rep(", ",9),",\n "))
}


#
# ----------- Examples of Chapter 9: Mixed procedures --------------
#


 bindec <- function(np,ind,cpc,cpr) {
 n      <- length(ind)
 ccar   <- matrix("-",ncol=np, nrow=n)
 for (i in 1:n) {
    j   <- 0
    num <- abs(ind[i])
    while (num != 0 & j < np) {
     j   <- j+1
     if (num %% 2 == 1) ccar[i,j] <- "X"
     num <- num %/% 2}}
   data.frame(Cp=round(cpc,3),Cp.r=round(cpr,3),ipr=ind,i=ccar)
 }
#-----------------------------------------------------------------------
# Read data
# 
 z <- c(-1, -2,  0,   35,         1,  0, -3,   20,
        -1, -2,  0,   30,         1,  0, -3,   39,
        -1, -2,  0,   24,         1,  0, -3,   16,
        -1, -2,  0,   37,         1,  0, -3,   27,
        -1, -2,  0,   28,         1,  0, -3,  -12,
        -1, -2,  0,   73,         1,  0, -3,    2,
        -1, -2,  0,   31,         1,  0, -3,   31,
        -1, -2,  0,   21,         1,  0, -1,   26,
        -1, -2,  0,   -5,         1,  0, -1,   60,
        -1,  0,  0,   62,         1,  0, -1,   48,
        -1,  0,  0,   67,         1,  0, -1,   -8,
        -1,  0,  0,   95,         1,  0, -1,   46,
        -1,  0,  0,   62,         1,  0, -1,   77,
        -1,  0,  0,   54,         1,  0,  1,   57,
        -1,  0,  0,   56,         1,  0,  1,   89,
        -1,  0,  0,   48,         1,  0,  1,  103,
        -1,  0,  0,   70,         1,  0,  1,  129,
        -1,  0,  0,   94,         1,  0,  1,  139,
        -1,  0,  0,   42,         1,  0,  1,  128,
        -1,  2,  0,  116,         1,  0,  1,   89,
        -1,  2,  0,  105,         1,  0,  1,   86,
        -1,  2,  0,   91,         1,  0,  3,  140,
        -1,  2,  0,   94,         1,  0,  3,  133,
        -1,  2,  0,  130,         1,  0,  3,  142,
        -1,  2,  0,   79,         1,  0,  3,  118,
        -1,  2,  0,  120,         1,  0,  3,  137,
        -1,  2,  0,  124,         1,  0,  3,   84,
        -1,  2,  0,   -8,         1,  0,  3,  101)
  xx    <- matrix(z,ncol=4, byrow=TRUE)
  dimnames(xx) <- list(NULL,c("z2","xS","xT","y"))
  z2    <- xx[,"z2"]; xS <- xx[,"xS"]; xT <- xx[,"xT"]
  x     <- cbind(1, z2, xS+xT, xS-xT, xS^2+xT^2, xS^2-xT^2, xT^3)
  y     <- xx[,"y"]
  wgt   <- vector("numeric",length(y))
  n     <- 56; np <- 7
 dfvals()
# Compute classical sigma and the t-statistics
 dfrpar(x,"ols",-1,-1); .dFv   <- .dFvGet()
 z     <- mirtsr(x,y,.dFv$ite)
 sigmc <- z$sigma; tstac <- z$t
 
# Compute robust sigma and the t-statistics
 dfrpar(x,"huber",-1,-1); .dFv   <- .dFvGet()
 z     <- mirtsr(x,y,.dFv$ite)
 sigmr <- z$sigma; tstar <- z$t
#
# All possible regressions including  the constant and linear terms
#
 vp     <- rep(-0.5, length=np)
 vp[1]  <- 3; vp[3]  <- 2; vp[4]  <- 1
 za     <- mfragr(x, y, vp, nc=18, .dFv$ite, sigmac=sigmc, sigmar=sigmr)
#
# Priorites by means of t-directed search
#
 zt     <- mfragr(x, y, tstar, nc=7, .dFv$ite, sigmac=sigmc, sigmar=sigmr)
#.......................................................................
{
 cat(" Estimates of sigma\n ")
 cat(" sigmc =",round(sigmc,3),", sigmr =",round(sigmr,3),"\n")
 cat(" Regressions on subset of variables:\n")
 cat("  C{p} C{p,@} ipr 1 2 3 4 5 6 7\n")
 cat(t(bindec(np,za$ipr,za$cpc,za$cpr)),sep=c(rep(" ",9),"\n"))
 cat("\n t-directed search\n")
 cat(" tstar[1:7]=(", round(tstar,3),sep=c("",rep(", ",6)))
 cat(")\n   C_p C{p,@} ipr 1 2 3 4 5 6 7\n")
 cat(t(bindec(np,zt$ipr,zt$cpc,zt$cpr)),sep=c(rep(" ",9),"\n")) 
}
#=======================================================================
#
# Read data; set defaults
# 
  z <- c(4.37, 5.23,   4.48, 5.42,   4.38, 5.02,   4.53, 5.10,
         4.56, 5.74,   4.01, 4.05,   4.42, 4.66,   4.45, 5.22,
         4.26, 4.93,   4.29, 4.26,   4.29, 4.66,   4.53, 5.18,
         4.56, 5.74,   4.42, 4.58,   4.38, 4.90,   4.43, 5.57,
         4.30, 5.19,   4.23, 3.94,   4.22, 4.39,   4.38, 4.62,
         4.46, 5.46,   4.42, 4.18,   3.48, 6.05,   4.45, 5.06,
         3.84, 4.65,   4.23, 4.18,   4.38, 4.42,   4.50, 5.34,
         4.57, 5.27,   3.49, 5.89,   4.56, 5.10,   4.45, 5.34,
         4.26, 5.57,   4.29, 4.38,   4.45, 5.22,   4.55, 5.54,
         4.37, 5.12,   4.29, 4.22,   3.49, 6.29,   4.45, 4.98,
         3.49, 5.73,   4.42, 4.42,   4.23, 4.34,   4.42, 4.50,
         4.43, 5.45,   4.49, 4.85,   4.62, 5.62)
 cx      <- matrix(z, ncol=2, byrow=TRUE)
 n       <- nrow(cx); np <- ncol(cx)
 y       <- vector("numeric",length=n)
#
# Minimum Volume Ellipsoid covariances 
#
 dfvals(); .dFv   <- .dFvGet()
 z       <- mymvlm(cx,y,ilms=0,iopt=3,iseed=5321)
 dst     <- z$d;  cv <- z$cov; xvol <- z$xvol
#.......................................................................
{
 cat("Minimum Volume Ellipsoid covariances\n cv = (")
 cat(round(cv,3),sep=c(", ",", "))
 cat("), Objective function value =",round(xvol,3),"\ndistances:\n")
 cat(round(dst,3),sep=c(rep(", ",9),",\n"))
}
#=======================================================================  
#
# Read data; load defaults
# 
  z <- c(80, 27, 89, 42, 
         80, 27, 88, 37, 
         75, 25, 90, 37, 
         62, 24, 87, 28,
         62, 22, 87, 18, 
         62, 23, 87, 18, 
         62, 24, 93, 19, 
         62, 24, 93, 20,
         58, 23, 87, 15, 
         58, 18, 80, 14, 
         58, 18, 89, 14, 
         58, 17, 88, 13,
         58, 18, 82, 11, 
         58, 19, 93, 12, 
         50, 18, 89,  8, 
         50, 18, 86,  7,
         50, 19, 72,  8, 
         50, 19, 79,  8, 
         50, 20, 80,  9, 
         56, 20, 82, 15,
         70, 20, 91, 15)
 x       <- matrix(z, ncol=4, byrow=TRUE)
 y       <- x[,4]; x[,4] <- 1
 n       <- length(y); np <- ncol(x)
 nq      <- np+1
 dfvals()
#
# High breakdown point & high efficiency regression
#
 dfrpar(x,"S",-1,-1)
 z <- myhbhe(x, y, iseed=5431)
#.......................................................................
{
 cat("High breakdown point & high efficiency regression\n")
 cat(" theta0 = ("); cat(round(z$theta0,3),sep=", ")
 cat("), sigma0 =",round(z$sigm0,3))
 cat("\n theta1 = ("); cat(round(z$theta1,3),sep=", ")
 cat("), sigma1 = ",round(z$sigm1,3),", tbias =",sep="")
 cat(round(z$tbias,3),"\n")
}


#
# -------- Examples of Chapter 10: M-estimates for discrete GLM ---------
#

 glmb <- function(x,y,n,np,upar) {
#
# BI estimates of theta, A, ci and wa: Bernouilli responses, b=upar
#
# Initial theta, A (A0) and c (c0)
#
 ni     <- rep.int(1,n)
 z      <- gintac(x,y,ni,icase=1,b=upar,c=1.5)
 theta0 <- z$theta[1:np]; A0 <- z$a; c0 <- z$ci
# Initial distances |Ax_i| and cut off points a_i (wa)
 wa     <- upar/z$dist  
 vtheta <- x %*% theta0
 z      <- gfedca(vtheta, c0, wa, ni, icase=1)
 zc     <- ktaskw(x, z$d, z$e, f=1/n)      # See Chpt. 4
 covi   <- zc$cov
# Final theta, A, c (ci) and a (wa)
 z      <- gymain(x, y, ni, covi, A0, theta0, b = upar) 
 theta  <- z$theta; A <- z$a; ci <- z$ci; wa <- z$wa; nit <- z$nit
# Final cov. matrix and std. dev's of coeff. estimates
 z      <- gfedca(z$vtheta, ci, wa, ni, icase=1)
 sdev   <- NULL
 zc     <- ktaskw(x, z$d, z$e, f=1/n)
 for (i in 1:np) {ii <- i*(i+1)/2; sdev <- c(sdev,zc$cov[ii])}
 sdev   <- sqrt(sdev)
 list(theta=theta, A=A, ci=ci, wa=wa, nit=nit, sdev=sdev)}
#-----------------------------------------------------------------------
# Read data; load defaults
# 
  z <- c(3.70, 0.825, 1,   3.50, 1.090, 1,
         1.25, 2.500, 1,   0.75, 1.500, 1,
         0.80, 3.200, 1,   0.70, 3.500, 1,
         0.60, 0.750, 0,   1.10, 1.700, 0,
         0.90, 0.750, 0,   0.90, 0.450, 0,
         0.80, 0.570, 0,   0.55, 2.750, 0,
         0.60, 3.000, 0,   1.40, 2.330, 1,
         0.75, 3.750, 1,   2.30, 1.640, 1,
         3.20, 1.600, 1,   0.85, 1.415, 1,
         1.70, 1.060, 0,   1.80, 1.800, 1,
         0.40, 2.000, 0,   0.95, 1.360, 0,
         1.35, 1.350, 0,   1.50, 1.360, 0,
         1.60, 1.780, 1,   0.60, 1.500, 0,
         1.80, 1.500, 1,   0.95, 1.900, 0,
         1.90, 0.950, 1,   1.60, 0.400, 0,
         2.70, 0.750, 1,   2.35, 0.300, 0,
         1.10, 1.830, 0,   1.10, 2.200, 1,
         1.20, 2.000, 1,   0.80, 3.330, 1,
         0.95, 1.900, 0,   0.75, 1.900, 0,
         1.30, 1.625, 1)
 x     <- matrix(z, ncol=3, byrow=TRUE)
 y     <- x[,3]; x[,3] <- log(x[,2]); x[,2] <- log(x[,1]) ; x[,1] <- 1
 n     <- length(y); np <- ncol(x)
 dfvals()
 upar  <- 3.2*sqrt(np)
 z1    <- glmb(x,y,n,np,upar)
 
 upar  <- 3.7*sqrt(np)
 z2    <- glmb(x,y,n,np,upar)

 z     <- glmb(x,y,n,np,300) # Classical estimates
#.......................................................................
{
 cat("\n Robust estimates : upar=5.5426, nit =",z1$nit,"\n")
 cat(" {theta[i] (sdev[i]), i=1:3}\n ")
 for (i in 1:3) cat(round(z1$theta[i],3)," (",round(z1$sdev[i],3),")  ",sep="")
 cat("\n\n Robust estimates : upar=6.4086, nit =",z2$nit,"\n")
 cat(" {theta[i] (sdev[i]), i=1:3}\n ")
 for (i in 1:3) cat(round(z2$theta[i],3)," (",round(z2$sdev[i],3),")  ",sep="")
 cat("\n\n Classical estimates : upar=300, nit =",z$nit,"\n")
 cat(" {theta[i] (sdev[i]), i=1:3}\n ")
 for (i in 1:3) cat(round(z$theta[i],3)," (",round(z$sdev[i],3),")  ",sep="")
 cat("\n")
}
#-----------------------------------------------------------------------




