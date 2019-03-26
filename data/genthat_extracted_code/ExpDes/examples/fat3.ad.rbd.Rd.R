library(ExpDes)


### Name: fat3.ad.rbd
### Title: Triple factorial scheme plus an additional treatment in RBD
### Aliases: fat3.ad.rbd

### ** Examples

data(ex6)
attach(ex6)
data(respAd)
fat3.ad.rbd(fatorA, fatorB, fatorC, rep, resp, respAd, quali = c(TRUE, TRUE, TRUE), 
 mcomp = "snk", fac.names = c("Factor A", "Factor B", "Factor C"), sigT = 0.05, sigF = 0.05)



