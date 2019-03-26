library(OSCV)


### Name: ISE_fstar
### Title: The ISE function in the kernel density estimation (KDE) context
###   in the case when the underlying density is 'fstar'.
### Aliases: ISE_fstar

### ** Examples

## Not run: 
##D dev.new()
##D harray=seq(0.05,1.5,len=1000)
##D ISEarray=ISE_fstar(harray,100)
##D h_ISE=round(harray[which.min(ISEarray)],digits=4)
##D dev.new()
##D plot(harray,ISEarray,lwd=3,'l',xlab="h",ylab="ISE",main="ISE(h)",cex.main=2,cex.lab=1.7,
##D cex.axis=1.7)
##D legend(0.35,ISEarray[5],legend=c("n=100",paste("h_ISE=",h_ISE)),cex=1.8,bty="n")
## End(Not run)



