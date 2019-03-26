library(LFDR.MLE)


### Name: LFDR.MLE-package
### Title: Estimation of the Local False Discovery Rate using Type II
###   Maximum Likelihood Estimation.
### Aliases: LFDR.MLE-package LFDR.MLE
### Keywords: package Local False Discovery Rate LFDR Maximum Likelihood
###   Estimates Type II Maximum Likelihood Estimates Type II MLE LFDR-MLE
###   LFDR-L0O LFDR-L1O LFDR-LHO LFDR-MDL

### ** Examples

dFUN<-dabsTd; dfx <- 4
n.alternative <- 3; n.null <- 4; true.ncp <- 7

#NOTE: arguments for dFUN are x, df, ncp. If dFUN has other arguments, 
#please adapt them. For example:
#dFUN<-function(x,df,ncp){dnorm(x=x,mean=ncp,sd=df)};attr(dFUN,'name')<-'dnorm'

#In the examples, W is the result of the absolute value of the t.test statistics 
#on the data

W<-abs(c(rt(n=n.alternative,ncp=true.ncp,df=dfx),rt(n=n.null,ncp=0,df=dfx)))
W[c(1,3,5)]<-NA

z1<-lfdr.mle(x=W,dFUN=dFUN, df=dfx)
z2<-lfdr.mle(x=W,dFUN=dFUN, df=dfx,fixed.p0=0.4,fixed.ncp=4)
z3<-lfdr.mdl(x=W,df=dfx,dFUN=dFUN)
z4<-lfdr.l1o(x=W,df=dfx,dFUN=dFUN)
z5<-lfdr.lho(x=W,df=dfx,dFUN=dFUN,fixed.ncp=5)
z6<-lfdr.lo(x=W,v=1/3,df=dfx,dFUN=dFUN)
z7<-lfdr.mdlo(x=W,v=1/3,df=dfx,dFUN=dFUN)


## Don't show: 
W;str(z1);str(z2);str(z3);str(z4);str(z5);str(z6);str(z7)
## End(Don't show)



