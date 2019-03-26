library(npbr)


### Name: kern_smooth_bw
### Title: Bandwidth selection for kernel smoothing frontier estimators
### Aliases: kern_smooth_bw
### Keywords: optimize

### ** Examples

## Not run: 
##D data("green")
##D x.green <- seq(min(log(green$COST)), max(log(green$COST)),length.out=101)
##D options(np.tree=TRUE,crs.messages=FALSE,np.messages=FALSE)
##D h.pr.green.m<-kern_smooth_bw(log(green$COST),log(green$OUTPUT), method="m", 
##D  technique="pr", bw_method="cv")
##D h.noh.green.m<-kern_smooth_bw(log(green$COST),log(green$OUTPUT), method="m", 
##D  technique="noh", bw_method="bic")
##D y.pr.green.m<-kern_smooth(log(green$COST),log(green$OUTPUT), x.green, 
##D  h=h.pr.green.m, method="m", technique="pr")
##D y.noh.green.m<-kern_smooth(log(green$COST),log(green$OUTPUT), x.green, 
##D  h=h.noh.green.m, method="m", technique="noh")
##D plot(log(OUTPUT)~log(COST), data=green, xlab="log(COST)",ylab="log(OUTPUT)") 
##D lines(x.green, y.pr.green.m, lwd=4, lty=3, col="red") 
##D lines(x.green, y.noh.green.m, lwd=4, lty=3, col="blue")  
##D legend("topleft", col=c("blue","red"),lty=3, legend=c("noh","pr"), 
##D  lwd=4, cex=0.8)
## End(Not run) 



