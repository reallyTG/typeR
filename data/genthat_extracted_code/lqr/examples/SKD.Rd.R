library(lqr)


### Name: SKD
### Title: Skew Family Distributions
### Aliases: SKD dSKD pSKD qSKD rSKD
### Keywords: package quantile distribution skew

### ** Examples

## Not run: 
##D ## Let's plot (Normal Vs. Student-t's with 4 df)
##D ##Density
##D sseq = seq(15,65,length.out = 1000)
##D dens = dSKD(y=sseq,mu=50,sigma=3,p=0.75)
##D plot(sseq,dens,type="l",lwd=2,col="red",xlab="x",ylab="f(x)", main="Normal Vs. t(4) densities")
##D dens2 = dSKD(y=sseq,mu=50,sigma=3,p=0.75,dist="t",nu=4)
##D lines(sseq,dens2,type="l",lwd=2,col="blue",lty=2)
##D 
##D ## Distribution Function
##D df = pSKD(q=sseq,mu=50,sigma=3,p=0.75,dist = "laplace")
##D plot(sseq,df,type="l",lwd=2,col="blue",xlab="x",ylab="F(x)", main="Laplace Distribution function")
##D abline(h=1,lty=2)
##D 
##D ##Inverse Distribution Function
##D prob = seq(0.001,0.999,length.out = 1000)
##D idf = qSKD(prob=prob,mu=50,sigma=3,p=0.25,dist="cont",nu=0.3,gama=0.1) # 1 min appox
##D plot(prob,idf,type="l",lwd=2,col="gray30",xlab="x",ylab=expression(F^{-1}~(x)))
##D title(main="Skew Cont. Normal Inverse Distribution function")
##D abline(v=c(0,1),lty=2)
##D 
##D #Random Sample Histogram
##D sample = rSKD(n=20000,mu=50,sigma=3,p=0.2,dist="slash",nu=3)
##D seqq2 = seq(25,100,length.out = 1000)
##D dens3 = dSKD(y=seqq2,mu=50,sigma=3,p=0.2,dist="slash",nu=3)
##D hist(sample,breaks = 70,freq = FALSE,ylim=c(0,1.05*max(dens3,na.rm = TRUE)),main="")
##D title(main="Histogram and True density")
##D lines(seqq2,dens3,col="blue",lwd=2)
## End(Not run)



