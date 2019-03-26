library(OSCV)


### Name: ASE_reg
### Title: The ASE function for the local linear estimator (LLE) in the
###   regression context.
### Aliases: ASE_reg

### ** Examples

## Not run: 
##D # Example (ASE function for a random sample of size n=100 generated from the function reg3 that
##D # has six cusps. The function originates from the article of Savchuk et al. (2013).
##D # The level of the added Gaussian noise is sigma=1/1000).
##D n=100
##D dx=(1:n-0.5)/n
##D regx=reg3(dx)
##D ydat=regx+rnorm(n,sd=1/1000)
##D harray=seq(0.003,0.05,len=300)
##D ASEarray=ASE_reg(harray,dx,ydat,regx)
##D hmin=round(h_ASE_reg(dx,ydat,regx),digits=4)
##D dev.new()
##D plot(harray,ASEarray,'l',lwd=3,xlab="h",ylab="ASE",main="ASE function for a random sample
##D from r3",cex.lab=1.7,cex.axis=1.7,cex.main=1.5)
##D legend(0.029,0.0000008,legend=c("n=100","sigma=1/1000"),cex=1.7,bty="n")
##D legend(0.005,0.000002,legend=paste("h_ASE=",hmin),cex=2,bty="n")
## End(Not run)



