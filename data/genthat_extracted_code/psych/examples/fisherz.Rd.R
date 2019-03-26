library(psych)


### Name: fisherz
### Title: Transformations of r, d, and t including Fisher r to z and z to
###   r and confidence intervals
### Aliases: fisherz fisherz2r r.con r2c r2t t2r g2r chi2r r2chi cor2cov
### Keywords: multivariate models

### ** Examples


 n <- 30
 r <- seq(0,.9,.1)
 d <- r2d(r)
 rc <- matrix(r.con(r,n),ncol=2)
 t <- r*sqrt(n-2)/sqrt(1-r^2)
 p <- (1-pt(t,n-2))*2
 r1 <- t2r(t,(n-2))
 r2 <- d2r(d)
 chi <- r2chi(r,n)
 r3 <- chi2r(chi,n)
 r.rc <- data.frame(r=r,z=fisherz(r),lower=rc[,1],upper=rc[,2],t=t,p=p,d=d,
     chi2=chi,d2r=r2,t2r=r1,chi2r=r3)
 round(r.rc,2)





