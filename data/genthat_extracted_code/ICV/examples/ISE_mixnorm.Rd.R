library(ICV)


### Name: ISE_mixnorm
### Title: The ISE function in the case when the underlying density is the
###   specified mixture of normal distributions.
### Aliases: ISE_mixnorm

### ** Examples

## Not run: 
##D harg=seq(0.01,1,len=100)
##D w=c(3/4,1/4)
##D mu=c(0,3/2)
##D sdev=c(1,1/3)
##D # The vectors w, mu, and sdev define the skewed bimodal density of Marron and Wand (1992).
##D dat=mixnorm(300,w,mu,sdev)
##D h_ISE=round(h_isemixnorm(dat,w,mu,sdev),digits=4)
##D ISEarray=ISE_mixnorm(harg,dat,w,mu,sdev)
##D dev.new()
##D plot(harg,ISEarray,'l',lwd=3,xlab="h, n=300",ylab="ISE",cex.lab=1.7,cex.axis=1.7,main="")
##D title(main="ISE(h)",cex.main=1.7)
##D legend(0.2,0.08,legend=paste("h_ISE=",h_ISE),cex=2)
## End(Not run)



