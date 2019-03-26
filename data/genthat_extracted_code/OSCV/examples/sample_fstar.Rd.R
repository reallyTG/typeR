library(OSCV)


### Name: sample_fstar
### Title: Taking a random sample from 'fstar'.
### Aliases: sample_fstar

### ** Examples

## Not run: 
##D dev.new()
##D plot(density(sample_fstar(5000),bw=0.1),lwd=2,ylim=c(0,0.32),xlab="argument",ylab="density",
##D main="KDE and the true density fstar",cex.lab=1.7, cex.axis=1.7,cex.main=1.7)
##D lines(seq(-3.5,3.5,len=1000),fstar(seq(-3.5,3.5,len=1000)),lwd=3,lty="dashed")
##D legend(-3,0.3,legend=c("KDE","True density","h=0.1","n=5000"),lwd=c(2,3),
##D lty=c("solid","dashed"),col=c("black","black","white","white"))
## End(Not run)



