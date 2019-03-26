library(OSCV)


### Name: h_OSCV_reg
### Title: The OSCV bandwidth in the regression context.
### Aliases: h_OSCV_reg

### ** Examples

## Not run: 
##D # Example (Old Faithful geyser)
##D xdat=faithful[[2]]     # waiting time
##D ydat=faithful[[1]]     # eruption duration
##D u=seq(40,100,len=1000)
##D h_oscv=round(h_OSCV_reg(xdat,ydat,0),digits=4)
##D l=loclin(u,xdat,ydat,h_oscv)
##D dev.new()
##D plot(xdat,ydat,pch=20,cex=1.5,cex.axis=1.7,cex.lab=1.7,xlab="waiting time",
##D ylab="eruption duration")
##D lines(u,l,'l',lwd=3)
##D title(main="Data and LLE",cex.main=1.7)
##D legend(35,5,legend=paste("h_OSCV=",h_oscv),cex=2,bty="n")
##D legend(80,3,legend="n=272",cex=2,bty="n")
## End(Not run)



