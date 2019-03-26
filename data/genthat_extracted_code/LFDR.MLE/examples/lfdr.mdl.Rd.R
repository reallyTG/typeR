library(LFDR.MLE)


### Name: lfdr.mdl
### Title: Minimum description length (MDL) method for estimation of LFDR.
### Aliases: lfdr.mdl lfdr.mdlo
### Keywords: MDL LFDR-MDL Minimum Description Length lfdr.mdl lfdr.mdlo

### ** Examples

dfx <- 4;n.alt <- 1;n.null <- 4;true.ncp <- 7
#numeric imput data: statistics of the data with missing values (removed internally)
#(result of a absolute t.test statistics on the data)
W<-abs(c(rt(n=n.alt,ncp=true.ncp,df=dfx),rt(n=n.null,ncp=0,df=dfx)))
W[3]<-NA

z1<-lfdr.mdl(x=W,df=dfx)
z2<-lfdr.mdl(x=W,df=dfx,fixed.ncp=10)
z3<-lfdr.mdlo(x=W,df=dfx,v=1/3,fixed.p0=0.3)
## Don't show: 
W;str(z1);str(z2);str(z3)
## End(Don't show)



