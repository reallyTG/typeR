library(OSCV)


### Name: CV_reg
### Title: The cross-validation (CV) function in the regression context.
### Aliases: CV_reg

### ** Examples

## Not run: 
##D # Example (Old Faithful geyser). Take x=waiting time; y=eruption duration. The sample size n=272.
##D xdat=faithful[[2]]
##D ydat=faithful[[1]]
##D harray=seq(0.5,10,len=100)
##D cv=CV_reg(harray,xdat,ydat)
##D R=range(xdat)
##D h_cv=round(optimize(CV_reg,c(0.01,(R[2]-R[1]/4)),desx=xdat,y=ydat)$minimum,digits=4)
##D dev.new()
##D plot(harray,cv,'l',lwd=3,xlab="h",ylab="CV(h)",main="CV function for the Old Faithful 
##D geyser data", cex.lab=1.7,cex.axis=1.7,cex.main=1.5)
##D legend(6,0.155,legend="n=272",cex=1.8,bty="n")
##D legend(1,0.18,legend=paste("h_CV=",h_cv),cex=2,bty="n")
## End(Not run)



