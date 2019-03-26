library(tsDyn)


### Name: VAR.sim
### Title: Simulate or bootstrap a VAR model
### Aliases: VAR.sim VAR.boot
### Keywords: bootstrap ts

### ** Examples


## VAR.sim: simulate VAR as in Enders 2004, p 268
B1<-matrix(c(0.7, 0.2, 0.2, 0.7), 2)
var1 <- VAR.sim(B=B1, n=100, include="none")
ts.plot(var1, type="l", col=c(1,2))


B2<-rbind(c(0.5, 0.5, 0.5), c(0, 0.5, 0.5))
varcov<-matrix(c(1,0.2, 0.3, 1),2)
var2 <- VAR.sim(B=B2, n=100, include="const", varcov=varcov)
ts.plot(var2, type="l", col=c(1,2))

## VAR.boot: Bootstrap a VAR 
data(zeroyld)
mod <- lineVar(data=zeroyld,lag=1)
VAR.boot(mod)





