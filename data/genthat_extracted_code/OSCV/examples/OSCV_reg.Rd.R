library(OSCV)


### Name: OSCV_reg
### Title: The OSCV function in the regression context.
### Aliases: OSCV_reg

### ** Examples

## Not run: 
##D # The Old Faithful geyser data set "faithful" is used. The sample size n=272.
##D # The OSCV curves based on the Gaussian kernel and the robust kernel H_I (with 
##D # alpha=16.8954588 and sigma=1.01) are plotted. The horizontal scales of the curves
##D # are changed such that their global minimizers are to be used in computing the
##D # Gaussian local linear estimates of the regression function.
##D xdat=faithful[[2]] #waiting time
##D ydat=faithful[[1]] #eruption duration
##D barray=seq(0.5,10,len=250)
##D C_gauss=C_smooth(1,1)
##D OSCV_gauss=OSCV_reg(barray/C_gauss,xdat,ydat,0)
##D h_gauss=round(h_OSCV_reg(xdat,ydat,0),digits=4)
##D dev.new()
##D plot(barray,OSCV_gauss,'l',lwd=3,cex.lab=1.7,cex.axis=1.7,xlab="h",ylab="OSCV criterion")
##D title(main="OSCV based on the Gaussian kernel",cex.main=1.7)
##D legend(2.5,0.25,legend=paste("h_min=",h_gauss),cex=2,bty="n")
##D C_H_I=C_smooth(16.8954588,1.01)
##D OSCV_H_I=OSCV_reg(barray/C_H_I,xdat,ydat,1)
##D h_H_I=round(barray[which.min(OSCV_H_I)],digits=4)
##D dev.new()
##D plot(barray,OSCV_H_I,'l',lwd=3,cex.lab=1.7,cex.axis=1.7,xlab="h",ylab="OSCV criterion",
##D ylim=c(0.15,0.5))
##D title(main="OSCV based on the robust kernel H_I",cex.main=1.7)
##D legend(2.5,0.4,legend=paste("h_min=",h_H_I),cex=2,bty="n")
## End(Not run)



