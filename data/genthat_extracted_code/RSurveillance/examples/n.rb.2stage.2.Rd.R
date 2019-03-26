library(RSurveillance)


### Name: n.rb.2stage.2
### Title: Sample size for 2-stage risk-based surveillance, allowing for
###   risk factors at either or both cluster and unit level
### Aliases: n.rb.2stage.2
### Keywords: methods

### ** Examples

rr.c<- c(5,3,1)
ppr.c<- c(0.1, 0.2, 0.7)
spr.c<- c(0.4, 0.4, 0.2)
rr.u<- c(4,1)
ppr.u<- c(0.1, 0.9)
spr.u<- c(1, 0)
n.rb.2stage.2(rr.c, ppr.c, spr.c, pstar.c=0.02, rr.u, ppr.u, 
  spr.u, 0.1, se=0.9, sep.c=0.5, sep.sys=0.95) 
n.rb.2stage.2(c(3,1), c(0.2,0.8), c(0.7,0.3), pstar.c=0.05, 
  pstar.u=0.1, se=0.9, sep.c=0.95, sep.sys=0.99)



