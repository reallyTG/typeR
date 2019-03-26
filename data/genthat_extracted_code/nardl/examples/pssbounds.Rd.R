library(nardl)


### Name: pssbounds
### Title: pssbounds
### Aliases: pssbounds
### Keywords: ARDL bounds cointegration, test,

### ** Examples

reg<-nardl(food~inf,fod,ic="aic",maxlags = TRUE,graph = TRUE,case=3)
pssbounds(case=reg$case,fstat=reg$fstat,obs=reg$obs,k=reg$k)
# F-stat concludes I(1) and cointegrating, t-stat concludes I(0).





