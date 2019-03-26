library(OSCV)


### Name: H_I
### Title: The family of two-sided cross-validation kernels H_I.
### Aliases: H_I

### ** Examples

## Not run: 
##D # Plotting the robust kernel from Savchuk and Hart (2017) with alpha=16.8954588 and sigma=1.01.
##D u=seq(-5,5,len=1000)
##D ker=H_I(u,16.8954588,1.01)
##D dev.new()
##D plot(u,ker,'l',lwd=3,cex.axis=1.7, cex.lab=1.7)
##D title(main="Robust kernel H_I along with the Gaussian kernel (phi)",cex=1.7)
##D lines(u,dnorm(u),lty="dashed",lwd=3)
##D legend(-4.85,0.3,lty=c("solid","dashed"),lwd=c(3,3),legend=c("H_I","phi"),cex=1.5)
##D legend(1,0.4,legend=c("alpha=16.8955","sigma=1.01"),cex=1.5,bty="n")
## End(Not run)



