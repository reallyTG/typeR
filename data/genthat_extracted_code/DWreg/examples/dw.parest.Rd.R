library(DWreg)


### Name: dw.parest
### Title: Parameter estimation for discrete Weibull
### Aliases: dw.parest
### Keywords: dw.parest

### ** Examples

x<-rdw(1000,q=0.9,beta=1.5)
dw.parest(x) #maximum likelihood estimates
dw.parest(x,method="proportion") #proportion estimates



