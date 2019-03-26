library(quantreg.nonpar)


### Name: npqr
### Title: Nonparametric Series Quantile Regression
### Aliases: npqr
### Keywords: nonparametric regression htest

### ** Examples

data(india)

## Subset the data for speed
india.subset<-india[1:1000,]

formula=cheight~mbmi+breastfeeding+mage+medu+edupartner
  
basis.bsp <- create.bspline.basis(breaks=quantile(india$cage,c(0:10)/10))
  
n=length(india$cage)
B=500
alpha=.95
taus=c(1:24)/25
print.taus=c(1:4)/5

## Inference on average growth rate

piv.bsp <- npqr(formula=formula, data=india.subset, basis=basis.bsp, 
	var="cage", taus=taus, print.taus=print.taus, B=B, nderivs=1, 
	average=1, alpha=alpha, process="pivotal", rearrange=FALSE, 
	uniform=TRUE, se="unconditional", printOutput=TRUE, method="fn")

yrange<-range(piv.bsp$CI)
xrange<-c(0,1)
plot(xrange,yrange,type="n",xlab="",ylab="Average Growth (cm/month)")
lines(piv.bsp$taus,piv.bsp$point.est)
lines(piv.bsp$taus,piv.bsp$CI[1,,1],col="blue")
lines(piv.bsp$taus,piv.bsp$CI[1,,2],col="blue")
title("Average Growth Rate")

## Estimation on average growth acceleration with no inference

piv.bsp.secondderiv <- npqr(formula=formula, data=india.subset, 
	basis=basis.bsp, var="cage", taus=taus, print.taus=print.taus, 
	B=B, nderivs=2, average=0, alpha=alpha, process="none", 
	se="conditional", rearrange=FALSE, printOutput=FALSE, method="fn")

xsurf<-as.vector(piv.bsp.secondderiv$taus)
ysurf<-as.vector(piv.bsp.secondderiv$var.unique)
zsurf<-t(piv.bsp.secondderiv$point.est)

persp(xsurf, ysurf, zsurf, xlab="Quantile", ylab="Age (months)",
	zlab="Growth Acceleration", ticktype="detailed", phi=30, 
	theta=120, d=5, col="green", shade=0.75, main="Growth Acceleration")




