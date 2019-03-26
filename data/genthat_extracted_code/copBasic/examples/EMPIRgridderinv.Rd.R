library(copBasic)


### Name: EMPIRgridderinv
### Title: Derivative Inverses of the Grid of the Bivariate Empirical
###   Copula for V with respect to U
### Aliases: EMPIRgridderinv
### Keywords: empirical copula empirical copula (derivative inverses)
###   derivative

### ** Examples

## Not run: 
##D uv <- simCOP(n=10000, cop=PSP, ploton=FALSE, points=FALSE)
##D fakeU <- lmomco::pp(uv[,1], sort=FALSE)
##D fakeV <- lmomco::pp(uv[,2], sort=FALSE)
##D uv <- data.frame(U=fakeU, V=fakeV)
##D 
##D uv.grid <- EMPIRgrid(para=uv, deluv=.1) # CPU hungry
##D uv.inv1 <- EMPIRgridderinv(empgrid=uv.grid)
##D uv.inv2 <- EMPIRgridderinv2(empgrid=uv.grid)
##D plot(uv, pch=16, col=rgb(0,0,0,.1), xlim=c(0,1), ylim=c(0,1),
##D      xlab="U, NONEXCEEDANCE PROBABILITY", ylab="V, NONEXCEEDANCE PROBABILITY")
##D lines(qua.regressCOP(f=0.5, cop=PSP), col=2)
##D lines(qua.regressCOP(f=0.2, cop=PSP), col=2)
##D lines(qua.regressCOP(f=0.7, cop=PSP), col=2)
##D lines(qua.regressCOP(f=0.1, cop=PSP), col=2)
##D lines(qua.regressCOP(f=0.9, cop=PSP), col=2)
##D 
##D med.wrtu <- EMPIRqua.regress(f=0.5, empinv=uv.inv1)
##D lines(med.wrtu, col=2, lwd=4)
##D qua.wrtu <- EMPIRqua.regress(f=0.2, empinv=uv.inv1)
##D lines(qua.wrtu, col=2, lwd=2, lty=2)
##D qua.wrtu <- EMPIRqua.regress(f=0.7, empinv=uv.inv1)
##D lines(qua.wrtu, col=2, lwd=2, lty=2)
##D qua.wrtu <- EMPIRqua.regress(f=0.1, empinv=uv.inv1)
##D lines(qua.wrtu, col=2, lwd=2, lty=4)
##D qua.wrtu <- EMPIRqua.regress(f=0.9, empinv=uv.inv1)
##D lines(qua.wrtu, col=2, lwd=2, lty=4)
##D 
##D lines(qua.regressCOP2(f=0.5, cop=PSP), col=4)
##D lines(qua.regressCOP2(f=0.2, cop=PSP), col=4)
##D lines(qua.regressCOP2(f=0.7, cop=PSP), col=4)
##D lines(qua.regressCOP2(f=0.1, cop=PSP), col=4)
##D lines(qua.regressCOP2(f=0.9, cop=PSP), col=4)
##D 
##D med.wrtv <- EMPIRqua.regress2(f=0.5, empinv=uv.inv2)
##D lines(med.wrtv, col=4, lwd=4)
##D qua.wrtv <- EMPIRqua.regress2(f=0.2, empinv=uv.inv2)
##D lines(qua.wrtv, col=4, lwd=2, lty=2)
##D qua.wrtv <- EMPIRqua.regress2(f=0.7, empinv=uv.inv2)
##D lines(qua.wrtv, col=4, lwd=2, lty=2)
##D qua.wrtv <- EMPIRqua.regress2(f=0.1, empinv=uv.inv2)
##D lines(qua.wrtv, col=4, lwd=2, lty=4)
##D qua.wrtv <- EMPIRqua.regress2(f=0.9, empinv=uv.inv2)
##D lines(qua.wrtv, col=4, lwd=2, lty=4)#
## End(Not run)

## Not run: 
##D # Now try a much more complex shape
##D para   <- list(alpha=0.15,  beta=0.65, cop1=PLACKETTcop, cop2=PLACKETTcop,
##D                para1=0.005, para2=1000)
##D uv <- simCOP(n=30000, cop=composite2COP, para=para)
##D fakeU <- lmomco::pp(uv[,1], sort=FALSE)
##D fakeV <- lmomco::pp(uv[,2], sort=FALSE)
##D uv <- data.frame(U=fakeU, V=fakeV)
##D 
##D uv.grid <- EMPIRgrid(para=uv, deluv=0.05) # CPU hungry
##D uv.inv1 <- EMPIRgridderinv(empgrid=uv.grid)
##D uv.inv2 <- EMPIRgridderinv2(empgrid=uv.grid)
##D plot(uv, pch=16, col=rgb(0,0,0,0.1), xlim=c(0,1), ylim=c(0,1),
##D      xlab="U, NONEXCEEDANCE PROBABILITY", ylab="V, NONEXCEEDANCE PROBABILITY")
##D lines(qua.regressCOP(f=0.5, cop=composite2COP, para=para), col=2)
##D lines(qua.regressCOP(f=0.2, cop=composite2COP, para=para), col=2)
##D lines(qua.regressCOP(f=0.7, cop=composite2COP, para=para), col=2)
##D lines(qua.regressCOP(f=0.1, cop=composite2COP, para=para), col=2)
##D lines(qua.regressCOP(f=0.9, cop=composite2COP, para=para), col=2)
##D 
##D med.wrtu <- EMPIRqua.regress(f=0.5, empinv=uv.inv1)
##D lines(med.wrtu, col=2, lwd=4)
##D qua.wrtu <- EMPIRqua.regress(f=0.2, empinv=uv.inv1)
##D lines(qua.wrtu, col=2, lwd=2, lty=2)
##D qua.wrtu <- EMPIRqua.regress(f=0.7, empinv=uv.inv1)
##D lines(qua.wrtu, col=2, lwd=2, lty=2)
##D qua.wrtu <- EMPIRqua.regress(f=0.1, empinv=uv.inv1)
##D lines(qua.wrtu, col=2, lwd=2, lty=4)
##D qua.wrtu <- EMPIRqua.regress(f=0.9, empinv=uv.inv1)
##D lines(qua.wrtu, col=2, lwd=2, lty=4)
##D 
##D lines(qua.regressCOP2(f=0.5, cop=composite2COP, para=para), col=4)
##D lines(qua.regressCOP2(f=0.2, cop=composite2COP, para=para), col=4)
##D lines(qua.regressCOP2(f=0.7, cop=composite2COP, para=para), col=4)
##D lines(qua.regressCOP2(f=0.1, cop=composite2COP, para=para), col=4)
##D lines(qua.regressCOP2(f=0.9, cop=composite2COP, para=para), col=4)
##D 
##D med.wrtv <- EMPIRqua.regress2(f=0.5, empinv=uv.inv2)
##D lines(med.wrtv, col=4, lwd=4)
##D qua.wrtv <- EMPIRqua.regress2(f=0.2, empinv=uv.inv2)
##D lines(qua.wrtv, col=4, lwd=2, lty=2)
##D qua.wrtv <- EMPIRqua.regress2(f=0.7, empinv=uv.inv2)
##D lines(qua.wrtv, col=4, lwd=2, lty=2)
##D qua.wrtv <- EMPIRqua.regress2(f=0.1, empinv=uv.inv2)
##D lines(qua.wrtv, col=4, lwd=2, lty=4)
##D qua.wrtv <- EMPIRqua.regress2(f=0.9, empinv=uv.inv2)
##D lines(qua.wrtv, col=4, lwd=2, lty=4)#
## End(Not run)



