library(ICV)


### Name: LocICV
### Title: The local ICV function.
### Aliases: LocICV

### ** Examples

## Not run: 
##D # Local ICV function for a random sample of size n=150 from the kurtotic density of Marron and
##D # Wand (1992).
##D dat=mixnorm(150,c(2/3,1/3),c(0,0),c(1,1/10))
##D a=2.42   # alpha
##D s=5.06   # sigma
##D harg=seq(0.025,1,len=100)
##D Xest=0.1    # estimation point
##D LocICV_Xest=numeric(length(harg))
##D for(i in 1:length(harg))
##D   LocICV_Xest[i]=LocICV(harg[i],Xest,dat,0.2,a,s)
##D h_Xest=optimize(LocICV,c(0.001,0.2),tol=0.001,xest=Xest,eta=0.2,x=dat,alpha=a,sigma=s)$minimum
##D h_Xest=round(h_Xest,digits=4)
##D dev.new()
##D plot(harg,LocICV_Xest,'l',lwd=3,xlab="harg",ylab="LocICV_Xest",main="",cex.lab=1.7, cex.axis=1.7)
##D title(main=paste("Local ICV function at x=",Xest),cex.main=1.7)
##D legend(0.1,max(LocICV_Xest),legend=paste("h_x=",h_Xest),cex=1.7)
##D legend(0.2,max(LocICV_Xest)-0.15,legend="Note: first local minimizer is used", cex=1.5,bty="n")
## End(Not run)



