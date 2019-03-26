library(gsl)


### Name: Legendre
### Title: Legendre functions
### Aliases: Legendre legendre legendre_P1 legendre_P2 legendre_P3
###   legendre_Pl legendre_Pl_array legendre_Q0 legendre_Q1 legendre_Ql
###   legendre_Plm legendre_Plm_array legendre_sphPlm legendre_sphPlm_array
###   conicalP_half conicalP_mhalf conicalP_0 conicalP_1 conicalP_sph_reg
###   conicalP_cyl_reg legendre_H3d_0 legendre_H3d_1 legendre_H3d
###   legendre_H3d_array conical Conical
### Keywords: array

### ** Examples

 theta <- seq(from=0,to=pi/2,len=100)
 plot(theta,legendre_P1(cos(theta)),type="l",ylim=c(-0.5,1), main="Figure 8.1, p338")
 abline(1,0)
 lines(theta,legendre_P2(cos(theta)),type="l")
 lines(theta,legendre_P3(cos(theta)),type="l")

x <- seq(from=0,to=1,len=600)
plot(x, legendre_Plm(3,1,x), type="l",lty=3,main="Figure 8.2, p338: note sign error")
lines(x,legendre_Plm(2,1,x), type="l",lty=2)
lines(x,legendre_Plm(1,1,x), type="l",lty=1)
abline(0,0)


plot(x,legendre_Ql(0,x),xlim=c(0,1), ylim=c(-1,1.5), type="l",lty=1,
main="Figure 8.4, p339")
lines(x,legendre_Ql(1,x),lty=2)
lines(x,legendre_Ql(2,x),lty=3)
lines(x,legendre_Ql(3,x),lty=4)
abline(0,0)

#table 8.1 of A&S:
t(legendre_Pl_array(10, seq(from=0,to=1,by=0.01))[1+c(2,3,9,10),])

#table 8.3:
f <- function(n){legendre_Ql(n, seq(from=0,to=1,by=0.01))}
sapply(c(0,1,2,3,9,10),f)





