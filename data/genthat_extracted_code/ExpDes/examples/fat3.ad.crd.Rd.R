library(ExpDes)


### Name: fat3.ad.crd
### Title: Triple factorial scheme plus an additional treatment in CRD
### Aliases: fat3.ad.crd

### ** Examples

data(ex6)
attach(ex6)
data(respAd)
fat3.ad.crd(fatorA, fatorB, fatorC, rep, resp, respAd, quali = c(TRUE, TRUE, TRUE), 
 mcomp = "duncan", fac.names = c("Factor A", "Factor B", "Factor C"), sigT = 0.05, sigF = 0.05)



