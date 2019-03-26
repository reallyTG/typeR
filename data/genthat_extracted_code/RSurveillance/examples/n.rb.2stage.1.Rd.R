library(RSurveillance)


### Name: n.rb.2stage.1
### Title: sample size for 2-stage risk-based surveillance, risk factor at
###   cluster level only
### Aliases: n.rb.2stage.1
### Keywords: methods

### ** Examples

rr<- c(5,3,1)
ppr<- c(0.1, 0.2, 0.7)
spr<- c(0.4, 0.4, 0.2)
n.rb.2stage.1(rr, ppr, spr, pstar.c=0.01, pstar.u=0.1, se =0.9, sep.c=0.8, sep.sys=0.95) 
n.rb.2stage.1(c(3,1), c(0.2,0.8), c(0.7,0.3),0.05, 0.1, 0.9, 0.95, 0.99)



