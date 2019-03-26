library(DWreg)


### Name: dw
### Title: Discrete Weibull
### Aliases: rdw qdw pdw ddw
### Keywords: dw

### ** Examples

x<-rdw(1000,q=0.9,beta=1.5)
hist(x)
plot(x,unlist(lapply(x,ddw,q=0.9,beta=1.5)),ylab="density")
plot(x,unlist(lapply(x,pdw,q=0.9,beta=1.5)),ylab="cdf")



