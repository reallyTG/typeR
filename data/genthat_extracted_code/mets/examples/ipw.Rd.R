library(mets)


### Name: ipw
### Title: Inverse Probability of Censoring Weights
### Aliases: ipw

### ** Examples

## Not run: 
##D data("prt",package="mets")
##D prtw <- ipw(Surv(time,status==0)~country, data=prt[sample(nrow(prt),5000),],
##D             cluster="id",weight.name="w")
##D plot(0,type="n",xlim=range(prtw$time),ylim=c(0,1),xlab="Age",ylab="Probability")
##D count <- 0
##D for (l in unique(prtw$country)) {
##D     count <- count+1
##D     prtw <- prtw[order(prtw$time),]
##D     with(subset(prtw,country==l),
##D          lines(time,w,col=count,lwd=2))
##D }
##D legend("topright",legend=unique(prtw$country),col=1:4,pch=-1,lty=1)
## End(Not run)



