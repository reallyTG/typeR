library(carcass)


### Name: CIetterson
### Title: Confidence interval for the functions ettersonEq14,
###   ettersonEq14v1 and ettersonEq14v2
### Aliases: CIetterson
### Keywords: misc

### ** Examples

J <- c(2,3,2,4,3,5,3,2,3,4)
s <- plogis(seq(0.2, 2, length=sum(J)))
f <- plogis(seq(1.5, 0.9, length=length(J)))

s.lwr<- plogis(seq(0.2, 2, length=sum(J))-0.5)
f.lwr <- plogis(seq(1.5, 0.9, length=length(J))-0.3)

s.upr <- plogis(seq(0.2, 2, length=sum(J))+0.5)
f.upr <- plogis(seq(1.5, 0.9, length=length(J))+0.3)

CIetterson(s=s, s.lwr=s.lwr, s.upr=s.upr, f=f, f.lwr=f.lwr, f.upr=f.upr, J=J, nsim=100)
 # nsim is too low, please, increase!



