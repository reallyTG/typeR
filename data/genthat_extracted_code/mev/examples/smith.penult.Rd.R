library(mev)


### Name: smith.penult
### Title: Smith (1987) penultimate approximations
### Aliases: smith.penult

### ** Examples

#Threshold exceedance for Normal variables
qu <- seq(1,5,by=0.02)
penult <- smith.penult(densF=dnorm, distF=pnorm,
   ddensF=function(x){-x*dnorm(x)}, model="pot", u=qu)
plot(qu, penult$shape, type="l",xlab="Quantile",
   ylab="Penultimate shape",ylim=c(-0.5,0))
#Block maxima for Gamma variables -
#User must provide arguments for shape (or rate)
m <- seq(30,3650,by=30)
penult <- smith.penult(family = "gamma", model="bm", m=m, shape=0.1)
plot(m, penult$shape, type="l",
 xlab="Quantile", ylab="Penultimate shape")



