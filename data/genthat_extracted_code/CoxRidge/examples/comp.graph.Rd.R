library(CoxRidge)


### Name: comp.graph
### Title: Plot a 'cox.ridge' or 'cox.dynamic.ridge' object.
### Aliases: comp.graph
### Keywords: comp.graph

### ** Examples

data(ova)
attach(ova)
X <- cbind(karn,diam,figo)
X <- apply(X,2,function(x){(x-mean(x))/sqrt(var(x))})
Ft <- cbind(rep(1,nrow(X)),bs(time))
fit <- Dynamic.Ridge(time,death,X,Ft=Ft,fun="simple")
comp.graph(fit,all.terms=FALSE,variable=1)
par(mfrow=c(3,1))
comp.graph(fit)


