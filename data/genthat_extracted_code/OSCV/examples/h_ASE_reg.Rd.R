library(OSCV)


### Name: h_ASE_reg
### Title: The ASE-optimal bandwidth in the regression context.
### Aliases: h_ASE_reg

### ** Examples

## Not run: 
##D # Simulated example.
##D n=300
##D dx=runif(n)            #uniform design
##D regx=5*dx^10*(1-dx)^2+2.5*dx^2*(1-dx)^10
##D ydat=regx+rnorm(n,sd=1/250)
##D hase=round(h_ASE_reg(dx,ydat,regx),digits=4)
##D u=seq(0,1,len=1000)
##D fun=5*u^10*(1-u)^2+2.5*u^2*(1-u)^10
##D dev.new()
##D plot(dx,ydat,pch=20,cex=1.5,xlab="argument",ylab="function",cex.lab=1.7,cex.axis=1.7,
##D main="Function, data, and the ASE-optimal bandwidth",cex.main=1.5)
##D lines(u,fun,'l',lwd=3,col="blue")
##D legend(0,0.03,legend=paste("h_ASE=",hase),cex=1.8,bty="n")
##D legend(0.6,-0.002,legend=paste("n=",n),cex=2,bty="n")
## End(Not run)



