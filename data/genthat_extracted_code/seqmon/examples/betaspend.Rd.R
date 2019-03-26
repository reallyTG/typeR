library(seqmon)


### Name: betaspend
### Title: Function that calculates the lower boundaries for futility
### Aliases: betaspend

### ** Examples


f<- function(t) 0.025*t^4
g<- function(t) 0.15*t^3
t<-c(0.33,0.67,1)
cum_alphas<-f(t)
cum_betas<-g(t)
noncent<-qnorm(0.975)+qnorm(0.85)
upper_boundaries<-alphaspend(cum_alphas,t,int=rep(500, length(t)),tol=0.005)
lower_boundaries<-betaspend(cum_betas, upper_boundaries, t, int = rep(500,3), noncent, tol = 0.005) 



