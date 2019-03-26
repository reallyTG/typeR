library(nlr)


### Name: nlr
### Title: Non-Linear Robust fitt.
### Aliases: nlr
### Keywords: Nonlinear regression Robust statistics Robust Nonlinear
###   regression

### ** Examples

## Chicken fitt without hetroscedasticity
 d<-list(xr=Weights$Date, yr=Weights$Weight)
 fitt.chicken1 <- nlr(nlrobj1[[2]],data=d,control=nlr.control(method = "OLS",trace=TRUE))
fitt.chicken1$parameters
plot(fitt.chicken1)
## Chicken fitt with hetroscedasticity
# RME by default
fitt.chicken2<-nlr(formula=nlrobj1
                   [[14]],data=d,start=list(p1=2300,p2=42,p3=.11), 
                   robustform ="hampel",
                   tau=list
                   (sg=.09,landa=1),varianceform=nlrobjvarmdls1[[1]],
                   control=nlr.control(tolerance=1e-3))
fitt.chicken2$parameters
fitt.chicken2$hetro$parameters
plot(fitt.chicken2)
# autocorrelated case
xr = trade.ir[, 1]
yr = trade.ir[, 2]
a1 <-  nlr( nlrobj5[[18]],data=list(xr = xr, yr = yr),
correlation=list(StructName="corAR1"))
a1$parameters
plot(a1)



