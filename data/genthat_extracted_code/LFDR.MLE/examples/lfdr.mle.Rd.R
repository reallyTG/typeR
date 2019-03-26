library(LFDR.MLE)


### Name: lfdr.mle
### Title: Type II Maximum likelihood estimate of LFDR (LFDR-MLE).
### Aliases: lfdr.mle
### Keywords: L0O LFDR-MLE LFDR-L0O Type II MLE Type II Maximum Likelihood
###   Estimates Leave-zero-out lfdr.mle

### ** Examples

#numeric imput data: statistics of the data with missing values (removed internally)
#(result of a absolute t.test statistics on the data)
dfx <- 4;n.alt <- 1;n.null <- 4;true.ncp <- 7
W<-abs(c(rt(n=n.alt,ncp=true.ncp,df=dfx),rt(n=n.null,ncp=0,df=dfx)))
W[3]<-NA

z1<-lfdr.mle(x=W,dFUN=dabsTd, df=dfx)
z2<-lfdr.mle(x=W,dFUN=dabsTd, df=dfx, fixed.p0=0.4, fixed.ncp=4)

#other dFUN -------
#NOTE: arguments for dFUN are x, df, ncp. If dFUN has other arguments, 
#please adapt them. For example:

new.df<-function(x,df,ncp,...){df(x=x,ncp=ncp,df1=df,...)}
z3<-lfdr.mle(x=W,df=dfx,dFUN=new.df,df2=5)
## Don't show: 
W;str(z1);str(z2);str(z3)
## End(Don't show)




