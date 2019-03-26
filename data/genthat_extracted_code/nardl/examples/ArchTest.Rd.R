library(nardl)


### Name: ArchTest
### Title: ARCH test
### Aliases: ArchTest

### ** Examples


reg<-nardl(food~inf,fod,ic="aic",maxlags = TRUE,graph = TRUE,case=3)
x<-reg$selresidu
nlag<-reg$np
ArchTest(x,lags=nlag)




