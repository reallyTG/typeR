library(OSCV)


### Name: loclin
### Title: Computing the local linear estimate (LLE).
### Aliases: loclin

### ** Examples

## Not run: 
##D # Example (simulated data).
##D n=200
##D dx=(1:n-0.5)/n
##D regf=2*dx^10*(1-dx)^2+dx^2*(1-dx)^10
##D u=seq(0,1,len=1000)
##D ydat=regf+rnorm(n,sd=0.002)
##D dev.new()
##D plot(dx,regf,'l',lty="dashed",lwd=3,xlim=c(0,1),ylim=c(1.1*min(ydat),1.1*max(ydat)),
##D cex.axis=1.7,cex.lab=1.7)
##D title(main="Function, generated data, and LLE",cex.main=1.5)
##D points(dx,ydat,pch=20,cex=1.5)
##D lines(u,loclin(u,dx,ydat,0.05),lwd=3,col="blue")
##D legend(0,1.1*max(ydat),legend=c("LLE based on h=0.05","true regression function"),
##D lwd=c(2,3),lty=c("solid","dashed"),col=c("blue","black"),cex=1.5,bty="n")
##D legend(0.7,0.5*min(ydat),legend="n=200",cex=1.7,bty="n")
## End(Not run)



