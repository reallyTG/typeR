library(OSCV)


### Name: reg3
### Title: Nonsmooth regression function with six cusps.
### Aliases: reg3

### ** Examples

## Not run: 
##D # n=250 data points are generated from r3 by adding the Gaussian noise with sigma=1/500.
##D # The fixed evenly spaced design is used.
##D u=seq(0,1,len=1000)
##D n=250
##D xdat=(1:n-0.5)/n
##D ydat=reg3(xdat)+rnorm(n,sd=1/500)
##D h_oscv=round(h_OSCV_reg(xdat,ydat,1),digits=4) # L_G-based OSCV based on nonsmooth constant
##D l=loclin(u,xdat,ydat,h_oscv)
##D dev.new()
##D plot(xdat,ydat,pch=20,cex=1.5,cex.axis=1.5,cex.lab=1.5,xlab="x",ylab="y",
##D ylim=c(min(ydat),1.2*max(ydat)))
##D lines(u,l,'l',lwd=3,col="blue")
##D lines(u,reg3(u),lwd=3,lty="dashed")
##D title(main="Data, true regression function and LLE",cex.main=1.7)
##D legend(-0.05,0.003,legend=paste("h_OSCV=",h_oscv),cex=2,bty="n")
##D legend(0.65,0.025, legend="n=250",cex=2,bty="n")
##D legend(0,1.28*max(ydat),legend=c("LLE based on h_OSCV","true regression function"),lwd=c(3,3),
##D lty=c("solid","dashed"),col=c("blue","black"),bty="n",cex=1.5)
## End(Not run)



