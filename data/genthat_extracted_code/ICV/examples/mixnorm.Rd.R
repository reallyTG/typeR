library(ICV)


### Name: mixnorm
### Title: Generating a random sample from the specified mixture of normal
###   distributions.
### Aliases: mixnorm

### ** Examples

## Not run: 
##D # Generating a sample of size n=300 from the separated bimodal density of Marron and Wand (1992).
##D w=c(0.5,0.5)
##D mu=c(-3/2,3/2)
##D sdev=c(1/2,1/2)
##D dat=mixnorm(300,w,mu,sdev) # generated data vector
##D arg=seq(-4,4,len=1000)  # argument
##D f=w[1]*dnorm(arg,mu[1],sd=sdev[1])+w[2]*dnorm(arg,mu[2],sd=sdev[2])     # true density
##D dev.new()
##D hist(dat,freq=F,ylab="",main="",cex.lab=1.7,cex.axis=1.7,xlim=c(-4,4),lwd=2,ylim=c(0,0.45),
##D col='grey')
##D title(main="Separated bimodal density",cex.main=1.7)
##D legend(-5,0.4,legend="n=300",cex=2,bty="n")
##D lines(arg,f,lwd=3,'l')
## End(Not run)



