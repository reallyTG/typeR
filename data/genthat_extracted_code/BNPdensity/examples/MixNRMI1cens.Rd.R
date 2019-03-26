library(BNPdensity)


### Name: MixNRMI1cens
### Title: Normalized Random Measures Mixture of Type I for censored data
### Aliases: MixNRMI1cens
### Keywords: distribution models nonparametrics

### ** Examples

### Example 1
## Not run: 
##D # Data
##D data(acidity)
##D x <- acidity
##D # Fitting the model under default specifications
##D out <- MixNRMI1cens(x,x)
##D # Plotting density estimate + 95##D 
##D attach(out)
##D m <- ncol(qx)
##D ymax <- max(qx[,m])
##D par(mfrow=c(1,1))
##D hist(x,probability=TRUE,breaks=20,col=grey(.9),ylim=c(0,ymax))
##D lines(xx,qx[,1],lwd=2)
##D lines(xx,qx[,2],lty=3,col=4)
##D lines(xx,qx[,m],lty=3,col=4)
##D detach()
## End(Not run)

## Not run: 
##D ### Example 2
##D # Data
##D data(salinity)
##D # Fitting the model under default specifications
##D out <- MixNRMI1cens(xleft=salinity$left,xright=salinity$right,Nit=5000)
##D # Plotting density estimate + 95##D 
##D attach(out)
##D m <- ncol(qx)
##D ymax <- max(qx[,m])
##D par(mfrow=c(1,1))
##D plot(xx,qx$"q0.5",lwd=2,type="l",ylab="Density",xlab="Data")
##D lines(xx,qx[,2],lty=3,col=4)
##D lines(xx,qx[,m],lty=3,col=4)
##D # Plotting number of clusters
##D par(mfrow=c(2,1))
##D plot(R,type="l",main="Trace of R")
##D hist(R,breaks=min(R-0.5):max(R+0.5),probability=TRUE)
##D detach()
## End(Not run)



