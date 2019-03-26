library(mev)


### Name: smith.penult.fn
### Title: Smith (1987) third penultimate approximation
### Aliases: smith.penult.fn

### ** Examples

#Normal maxima example from Smith (1987)
m <- 100 #block of size 100
p <- smith.penult(family="norm",
   ddensF=function(x){-x*dnorm(x)}, model="bm", m=m, returnList=FALSE)
approx <- smith.penult.fn(loc=p[1], scale=p[2], shape=p[3],
   eps=p[3]^2+p[3]+p[2]^2, mdaGumbel=TRUE, model="bm")
x <- seq(0.5,6,by=0.001)
#First penultimate approximation
plot(x, exp(m*pnorm(x, log.p=TRUE)),type="l", ylab="CDF",
main="Distribution of the maxima of\n 100 standard normal variates")
lines(x, evd::pgev(x,loc=p[1], scale=p[2], shape=0),col=2)
lines(x, evd::pgev(x,loc=p[1], scale=p[2], shape=p[3]),col=3)
lines(x, approx$F(x),col=4)
legend(x="bottomright",lty=c(1,1,1,1),col=c(1,2,3,4),
   legend=c("Exact","1st approx.","2nd approx.","3rd approx"),bty="n")
plot(x, m*dnorm(x)*exp((m-1)*pnorm(x,log.p=TRUE)),type="l", ylab="Density",
main="Distribution of the maxima of\n 100 standard normal variates")
lines(x, evd::dgev(x,loc=p[1], scale=p[2], shape=0),col=2)
lines(x, evd::dgev(x,loc=p[1], scale=p[2], shape=p[3]),col=3)
lines(x, approx$f(x),col=4)
legend(x="topright",lty=c(1,1,1,1),col=c(1,2,3,4),
 legend=c("Exact","1st approx.","2nd approx.","3rd approx"),bty="n")

#Threshold exceedances
p <- c(4,smith.penult(densF=dnorm, distF=pnorm,
 ddensF=function(x){-x*dnorm(x)},model="pot", u=4, returnList=FALSE))
approx <- smith.penult.fn(loc=p[1], scale=p[2], shape=p[3],
 eps=p[3]^2+p[3]+p[2]^2, mdaGumbel=TRUE, model="pot")
x <- seq(4.01,7,by=0.01)
#Distribution function
plot(x, 1-(1-pnorm(x))/(1-pnorm(p[1])),type="l", ylab="Conditional CDF",
main="Exceedances of 4\n for standard normal variates")
lines(x, evd::pgpd(x, loc=p[1], scale=p[2], shape=0),col=2)
lines(x, evd::pgpd(x, loc=p[1], scale=p[2], shape=p[3]),col=3)
lines(x, approx$F(x),col=4)
#Density
plot(x, dnorm(x)/(1-pnorm(p[1])),type="l", ylab="Conditional density",
main="Exceedances of 4\n for standard normal variates")
lines(x, evd::dgpd(x, loc=p[1], scale=p[2], shape=0),col=2)
lines(x, evd::dgpd(x, loc=p[1], scale=p[2], shape=p[3]),col=3)
lines(x, approx$f(x),col=4)



