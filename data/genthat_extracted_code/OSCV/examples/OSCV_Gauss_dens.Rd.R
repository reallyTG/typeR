library(OSCV)


### Name: OSCV_Gauss_dens
### Title: The OSCV function based on L_G, the one-sided Gaussian kernel,
###   in the kernel density estimation (KDE) context.
### Aliases: OSCV_Gauss_dens

### ** Examples

## Not run: 
##D dat_norm=rnorm(300)   #generating random sample of size n=300 from the standard normal density.
##D h_oscv=round(h_OSCV_dens(dat_norm,0),digits=4)
##D y=density(dat_norm,bw=h_oscv)
##D dev.new()
##D plot(y,lwd=3,cex.lab=1.7,cex.axis=1.7,cex.main=1.7,xlab=paste("n=100, h_OSCV=",h_oscv),
##D main="Standard normal density estimate by OSCV",ylim=c(0,0.45),xlim=c(-4.5,4.5))
##D u=seq(-5,5,len=1000)
##D lines(u,dnorm(u),lwd=3,lty="dashed",col="blue")
##D legend(0.75,0.4,legend=c("OSCV estimate","N(0,1) density"),lwd=c(3,3),lty=c("solid","dashed"),
##D col=c("black","blue"),bty="n",cex=1.25)
## End(Not run)



