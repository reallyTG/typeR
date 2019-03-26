library(OSCV)


### Name: L_I
### Title: The family of one-sided cross-validation kernels L_I.
### Aliases: L_I

### ** Examples

## Not run: 
##D # Plotting the robust one-sided kernel from Savchuk and Hart (2017) with 
##D # alpha=16.8954588 and sigma=1.01.
##D u=seq(-1,5,len=1000)
##D rker=L_I(u,16.8954588,1.01)
##D Gker=L_I(u,0,1)
##D dev.new()
##D plot(u,rker,'l',lwd=3,cex.axis=1.7, cex.lab=1.7)
##D title(main="One-sided kernels: L_I (robust) and L_G",cex=1.7)
##D lines(u,Gker,lty="dashed",lwd=3)
##D legend(0.5,2.5,lty=c("solid","dashed"),lwd=c(3,3),legend=c("L_I","L_G"),cex=1.7)
##D legend(2,1.5,legend=c("alpha=16.8955","sigma=1.01"),cex=1.5)
## End(Not run)



