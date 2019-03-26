library(ICV)


### Name: MISE_mixnorm
### Title: The MISE function in the case when the true density is the
###   specified mixture of normal distributions and the selection kernel
###   'L_ICV' is used in the cross-validation stage.
### Aliases: MISE_mixnorm

### ** Examples

## Not run: 
##D # Example 1. MISE for the separated bimodal density of Marron and Wand (1992).
##D # in the case (alpha,sigma)=(2.42,5.06), n=100.
##D harray=seq(0.05,1,len=1000)
##D w=c(1/2,1/2)
##D m=c(-3/2,3/2)
##D s=c(1/2,1/2)
##D MISEarray=MISE_mixnorm(harray,100,2.42,5.06,w,m,s)
##D hopt=round(optimize(MISE_mixnorm,c(0.01,1),n=100,alpha=2.42,sigma=5.06,w=w,mu=m,sdev=s)$minimum,
##D digits=4)
##D dev.new()
##D plot(harray,MISEarray,'l',lwd=3,xlab="h",ylab="MISE",cex.lab=1.7,cex.axis=1.7,main="")
##D title(main="MISE(h) for the separated bimodal density",cex.main=1.5)
##D legend(0.45,0.45,legend=c(paste("h_MISE=",hopt),"n=100"),bty="n",cex=1.7)
##D 
##D # Example 2. MISE for the N(0,1) density in the case of the Gaussian kernel and n=500.
##D harray=seq(0.03,1,len=1000)
##D MISEarray=MISE_mixnorm(harray,500,1,1,1,0,1)
##D hopt=round(optimize(MISE_mixnorm,c(0.01,1),n=500,alpha=1,sigma=1,w=1,mu=0,sdev=1)$minimum,digits=4)
##D dev.new()
##D plot(harray,MISEarray,'l',lwd=3,xlab="h",ylab="MISE",cex.lab=1.7,cex.axis=1.7,main="")
##D title(main="MISE(h) for the standard normal density",cex.main=1.7)
##D legend(0.2,0.02,legend=c(paste("h_MISE=",hopt),"n=500"),bty="n",cex=1.7)
## End(Not run)



