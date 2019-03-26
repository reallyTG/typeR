library(ICV)


### Name: L_ICV
### Title: The ICV selection kernel.
### Aliases: L_ICV

### ** Examples

## Not run: 
##D # Graph of the ICV selection kernel with (alpha,sigma)=(2.42,5.06).
##D u=seq(-10,10,len=1000)
##D kern=L_ICV(u,2.42,5.06)
##D dev.new()
##D plot(u,kern,'l',lwd=2,ylim=c(-0.2,1.2),ylab="kernel",cex.lab=1.7,cex.axis=1.7,main="")
##D lines(u,dnorm(u),lwd=3,lty="dashed")
##D title(main="Selection kernel with (alpha,sigma)=(2.42,5.06)",cex.main=1.6)
##D legend(-11, 1.2, legend=c("ICV kernel","Gaussian kernel"),lwd=c(3,3),lty=c(1,2),bty="n",cex=1.3)
## End(Not run)



