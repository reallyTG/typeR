library(SUE)


### Name: SUE.lm
### Title: The Subsampling Method for Linear Regression
### Aliases: SUE.lm
### Keywords: ~kwd1 ~kwd2

### ** Examples

##We analysis the well known stackloss data by using ordinary linear method and the subsampling method. 
##We also try two m values, m = 2 and 4, which represent toughly 10% and 20% working 
##proportion of outliers in the data. The subsample size is chosen to be the default size of ns = 11.

data(stackloss)
a1=lm(stack.loss~Air.Flow+Water.Temp+Acid.Conc.,data=stackloss)
a2=SUE.lm(stack.loss~Air.Flow+Water.Temp+Acid.Conc.,data=stackloss,k=57,ns=11,r=6, 
	consistency.check=TRUE,constant=0.25)
a3=SUE.lm(stack.loss~Air.Flow+Water.Temp+Acid.Conc.,data=stackloss,k=327,ns=11,r=5, 
	consistency.check=TRUE,constant=0.25)
par(mfrow=c(2,2))
plot(a1$fitted.values,a1$residuals,xlab="(a) fitted values",ylab="residuals",ylim=c(-12,12))
abline(h=0)
abline(h=9.7,lty=2)
abline(h=-9.7,lty=2)
plot(SUE.fitted.values(a2),SUE.residuals(a2),xlab="(b) fitted values",ylab="residuals",ylim=c(-12,12))
abline(h=0)
abline(h=9,lty=2)
abline(h=-9,lty=2)
plot(SUE.fitted.values(a3),SUE.residuals(a3),xlab="(c) fitted values",ylab="residuals",ylim=c(-12,12))
abline(h=0)
abline(h=3.75,lty=2)
abline(h=-3.75,lty=2)



