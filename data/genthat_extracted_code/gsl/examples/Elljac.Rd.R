library(gsl)


### Name: Elljac
### Title: Elliptic functions
### Aliases: Elljac elljac sn_cn_dn gsl_sn gsl_cn gsl_dn gsl_ns gsl_nc
###   gsl_nd gsl_sc gsl_sd gsl_cs gsl_cd gsl_ds gsl_dc
### Keywords: array

### ** Examples


K <- ellint_F(phi=pi/2,k=sqrt(1/2))  #note the sqrt: m=k^2
u <- seq(from=0,to=4*K,by=K/24)
jj <- elljac(u,1/2)
plot(u,jj$sn,type="l",xaxt="n",yaxt="n",bty="n",ylab="",xlab="",main="Fig 16.1, p570")
lines(u,jj$cn,lty=2)
lines(u,jj$dn,lty=3)
axis(1,pos=0,at=c(K,2*K,3*K,4*K),labels=c("K","2K","3K","4K"))
abline(0,0)
axis(2,pos=0,at=c(-1,1))
text(1.8*K,0.6,"sn u")
text(1.6*K,-0.5,"cn u")
text(2.6*K,0.9,"dn u")



 a <- seq(from=-5,to=5,len=100)
jj <- outer(a,a,function(a,b){a})
z <- jj+1i*t(jj)
e <- Re(gsl_cd(z,m=0.2))
e[abs(e)>10] <- NA
contour(a,a,e,nlev=55)



