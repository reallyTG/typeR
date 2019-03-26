library(sptm)


### Name: rstm
### Title: Simulate failure time from a semiparametric transformation model
### Aliases: rstm

### ** Examples


n=100
beta= c(log(.5), log(.7), log(1.2)) 
t0=2.9999
init = c(log(0.0373*t0),beta)        
ft=rstm (n, family="PH", runif(n,1,2), baseline.hazard=0.032) 





