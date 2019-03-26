library(ipdmeta)


### Name: Qt
### Title: Measures of covariate heterogeneity
### Aliases: Qt

### ** Examples


data(poynard)

#COVARIATE HETEROGENEITY FOR AGE

m <- (poynard$n0*poynard$age0+poynard$n1*poynard$age1)/(poynard$n0+poynard$n1)
n <- poynard$n0+poynard$n1
sigma2 <- ((poynard$n0-1)*poynard$age.s20+(poynard$n1-1)*poynard$age.s21)/(poynard$n0+poynard$n1-2)


Q <- Qt(m,n,sigma2)

lapply(Q,function(x){x/Q$t})




