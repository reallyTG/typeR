library(ICV)


### Name: ICV
### Title: The ICV function.
### Aliases: ICV

### ** Examples

#Example 1. Computation of ICV(h) at h=0.4 for a random sample of size n=100 from a N(0,1)
#distribution.
ICV(0.4,rnorm(100))

## Not run: 
##D #Example 2. (Calculations for a random sample of size n=250 from the separated bimodal density).
##D w=c(1/2,1/2)
##D mu=c(-3/2,3/2)
##D sdev=c(1/2,1/2)
##D # Generating a sample of size n=250 from the separated bimodal density of Marron and Wand (1992).
##D dat=mixnorm(250,w,mu,sdev)
##D h_OS=(243/(35*length(dat)*2*sqrt(pi)))^0.2*sd(dat)    # Computing the oversmoothed bandwidth.
##D h_opt=round(h_ICV(dat),digits=4)
##D harg=seq(0.1,3,len=100)
##D dev.new()
##D plot(harg,ICV(harg,x=dat),'l',lwd=3,xlab="h",ylab="ICV",cex.lab=1.7,cex.axis=1.7)
##D title(main="ICV(h)",cex.main=1.7)
##D lines(c(h_OS,h_OS),c(-0.5,0.5),lty="dashed",lwd=3)
##D legend(0.75,-0.05,legend="Vertical line shows the oversmothed bandwidth")
##D legend(1.35,0.1,legend=paste("h_ICV=",h_opt),cex=2,bty="n")
##D # Notice that the scale of the ICV function is such that its minimizer is the ICV bandwidth h_ICV.
##D # Thus, no additional rescaling of the ICV function's minimizer is needed to obtain the ICV
##D # bandwidth.
##D dev.new()
##D dens=density(dat,bw=h_opt)
##D plot(dens,main="",cex.lab=1.7,cex.axis=1.7,lwd=3,xlab=paste("n=250,","h=h_ICV=",h_opt),
##D ylim=c(0,0.45))
##D title(main="KDE based on h_ICV",cex.main=1.7)
##D arg=seq(-3.5,3.5,len=1000)
##D lines(arg,w[1]*dnorm(arg,mu[1],sd=sdev[1])+w[2]*dnorm(arg,mu[2],sd=sdev[2]),lwd=3,lty="dashed")
##D legend(-1,0.45,lty=c("solid","dashed"),lwd=c(3,3),legend=c("ICV estimate","True density"),bty="n")
## End(Not run)



