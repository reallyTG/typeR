library(copBasic)


### Name: EMPIRqua.regress
### Title: Quantile Regression of the Grid of the Bivariate Empirical
###   Copula for V with respect to U
### Aliases: EMPIRqua.regress
### Keywords: empirical copula empirical copula (quantile regression)

### ** Examples

## Not run: 
##D  # EXAMPLE 1
##D theta <- 25
##D uv <- simCOP(n=1000, cop=PLACKETTcop, para=theta, ploton=FALSE, points=FALSE)
##D fakeU <- lmomco::pp(uv[,1], sort=FALSE)
##D fakeV <- lmomco::pp(uv[,2], sort=FALSE)
##D uv <- data.frame(U=fakeU, V=fakeV)
##D 
##D uv.grid <- EMPIRgrid(para=uv, deluv=0.05) # CPU hungry
##D uv.inv1 <- EMPIRgridderinv(empgrid=uv.grid)
##D plot(uv, pch=16, col=rgb(0,0,0,.1), xlim=c(0,1), ylim=c(0,1),
##D      xlab="U, NONEXCEEDANCE PROBABILITY", ylab="V, NONEXCEEDANCE PROBABILITY")
##D lines(qua.regressCOP(f=0.5, cop=PLACKETTcop, para=theta), lwd=2)
##D lines(qua.regressCOP(f=0.2, cop=PLACKETTcop, para=theta), lwd=2)
##D lines(qua.regressCOP(f=0.7, cop=PLACKETTcop, para=theta), lwd=2)
##D lines(qua.regressCOP(f=0.1, cop=PLACKETTcop, para=theta), lwd=2)
##D lines(qua.regressCOP(f=0.9, cop=PLACKETTcop, para=theta), lwd=2)
##D 
##D med.wrtu <- EMPIRqua.regress(f=0.5, empinv=uv.inv1, lowess=TRUE, f.lowess=0.1)
##D lines(med.wrtu, col=2, lwd=4)
##D qua.wrtu <- EMPIRqua.regress(f=0.2, empinv=uv.inv1, lowess=TRUE, f.lowess=0.1)
##D lines(qua.wrtu, col=2, lwd=2, lty=2)
##D qua.wrtu <- EMPIRqua.regress(f=0.7, empinv=uv.inv1, lowess=TRUE, f.lowess=0.1)
##D lines(qua.wrtu, col=2, lwd=2, lty=2)
##D qua.wrtu <- EMPIRqua.regress(f=0.1, empinv=uv.inv1, lowess=TRUE, f.lowess=0.1)
##D lines(qua.wrtu, col=2, lwd=2, lty=4)
##D qua.wrtu <- EMPIRqua.regress(f=0.9, empinv=uv.inv1, lowess=TRUE, f.lowess=0.1)
##D lines(qua.wrtu, col=2, lwd=2, lty=4)
##D 
##D library(quantreg) # Quantile Regression by quantreg
##D U <- seq(0.01, 0.99, by=0.01)
##D rqlm <- rq(V~U, data=uv, tau=0.1)
##D rq.1 <- rqlm$coefficients[1] + rqlm$coefficients[2]*U
##D rqlm <- rq(V~U, data=uv, tau=0.2)
##D rq.2 <- rqlm$coefficients[1] + rqlm$coefficients[2]*U
##D rqlm <- rq(V~U, data=uv, tau=0.5)
##D rq.5 <- rqlm$coefficients[1] + rqlm$coefficients[2]*U
##D rqlm <- rq(V~U, data=uv, tau=0.7)
##D rq.7 <- rqlm$coefficients[1] + rqlm$coefficients[2]*U
##D rqlm <- rq(V~U, data=uv, tau=0.9)
##D rq.9 <- rqlm$coefficients[1] + rqlm$coefficients[2]*U
##D 
##D lines(U, rq.1, col=4, lwd=2, lty=4)
##D lines(U, rq.2, col=4, lwd=2, lty=2)
##D lines(U, rq.5, col=4, lwd=4)
##D lines(U, rq.7, col=4, lwd=2, lty=2)
##D lines(U, rq.9, col=4, lwd=2, lty=4)#
## End(Not run)

## Not run: 
##D  # EXAMPLE 2
##D # Start again with the PSP copula
##D uv <- simCOP(n=10000, cop=PSP, ploton=FALSE, points=FALSE)
##D fakeU <- lmomco::pp(uv[,1], sort=FALSE)
##D fakeV <- lmomco::pp(uv[,2], sort=FALSE)
##D uv <- data.frame(U=fakeU, V=fakeV)
##D 
##D uv.grid <- EMPIRgrid(para=uv, deluv=0.05) # CPU hungry
##D uv.inv1 <- EMPIRgridderinv(empgrid=uv.grid)
##D plot(uv, pch=16, col=rgb(0,0,0,0.1), xlim=c(0,1), ylim=c(0,1),
##D      xlab="U, NONEXCEEDANCE PROBABILITY", ylab="V, NONEXCEEDANCE PROBABILITY")
##D lines(qua.regressCOP(f=0.5, cop=PSP), lwd=2)
##D lines(qua.regressCOP(f=0.2, cop=PSP), lwd=2)
##D lines(qua.regressCOP(f=0.7, cop=PSP), lwd=2)
##D lines(qua.regressCOP(f=0.1, cop=PSP), lwd=2)
##D lines(qua.regressCOP(f=0.9, cop=PSP), lwd=2)
##D 
##D med.wrtu <- EMPIRqua.regress(f=0.5, empinv=uv.inv1, lowess=TRUE, f.lowess=0.1)
##D lines(med.wrtu, col=2, lwd=4)
##D qua.wrtu <- EMPIRqua.regress(f=0.2, empinv=uv.inv1, lowess=TRUE, f.lowess=0.1)
##D lines(qua.wrtu, col=2, lwd=2, lty=2)
##D qua.wrtu <- EMPIRqua.regress(f=0.7, empinv=uv.inv1, lowess=TRUE, f.lowess=0.1)
##D lines(qua.wrtu, col=2, lwd=2, lty=2)
##D qua.wrtu <- EMPIRqua.regress(f=0.1, empinv=uv.inv1, lowess=TRUE, f.lowess=0.1)
##D lines(qua.wrtu, col=2, lwd=2, lty=4)
##D qua.wrtu <- EMPIRqua.regress(f=0.9, empinv=uv.inv1, lowess=TRUE, f.lowess=0.1)
##D lines(qua.wrtu, col=2, lwd=2, lty=4)
##D 
##D library(quantreg) # Quantile Regression by quantreg
##D U <- seq(0.01, 0.99, by=0.01)
##D rqlm <- rq(V~U, data=uv, tau=0.1)
##D rq.1 <- rqlm$coefficients[1] + rqlm$coefficients[2]*U
##D rqlm <- rq(V~U, data=uv, tau=0.2)
##D rq.2 <- rqlm$coefficients[1] + rqlm$coefficients[2]*U
##D rqlm <- rq(V~U, data=uv, tau=0.5)
##D rq.5 <- rqlm$coefficients[1] + rqlm$coefficients[2]*U
##D rqlm <- rq(V~U, data=uv, tau=0.7)
##D rq.7 <- rqlm$coefficients[1] + rqlm$coefficients[2]*U
##D rqlm <- rq(V~U, data=uv, tau=0.9)
##D rq.9 <- rqlm$coefficients[1] + rqlm$coefficients[2]*U
##D 
##D lines(U, rq.1, col=4, lwd=2, lty=4)
##D lines(U, rq.2, col=4, lwd=2, lty=2)
##D lines(U, rq.5, col=4, lwd=4)
##D lines(U, rq.7, col=4, lwd=2, lty=2)
##D lines(U, rq.9, col=4, lwd=2, lty=4)#
## End(Not run)

## Not run: 
##D  # EXAMPLE 3
##D uv <- simCOP(n=10000, cop=PSP, ploton=FALSE, points=FALSE)
##D fakeU <- lmomco::pp(uv[,1], sort=FALSE)
##D fakeV <- lmomco::pp(uv[,2], sort=FALSE)
##D uv <- data.frame(U=fakeU, V=fakeV)
##D 
##D uv.grid <- EMPIRgrid(para=uv, deluv=0.1) # CPU hungry
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
##D  # EXAMPLE 4
##D # Now try a much more complex shape
##D # lowess smoothing on quantile regression is possible,
##D # see next example
##D para   <- list(alpha=0.15,  beta=0.65,
##D                cop1=PLACKETTcop, cop2=PLACKETTcop, para1=0.005, para2=1000)
##D uv <- simCOP(n=20000, cop=composite2COP, para=para)
##D fakeU <- lmomco::pp(uv[,1], sort=FALSE)
##D fakeV <- lmomco::pp(uv[,2], sort=FALSE)
##D uv <- data.frame(U=fakeU, V=fakeV)
##D 
##D uv.grid <- EMPIRgrid(para=uv, deluv=0.025) # CPU hungry
##D uv.inv1 <- EMPIRgridderinv(empgrid=uv.grid)
##D uv.inv2 <- EMPIRgridderinv2(empgrid=uv.grid)
##D plot(uv, pch=16, col=rgb(0,0,0,0.1), xlim=c(0,1), ylim=c(0,1),
##D      xlab="U, NONEXCEEDANCE PROBABILITY", ylab="V, NONEXCEEDANCE PROBABILTIY")
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

## Not run: 
##D  # EXAMPLE 5
##D plot(uv, pch=16, col=rgb(0,0,0,.1), xlim=c(0,1), ylim=c(0,1),
##D      xlab="U, NONEXCEEDANCE PROBABILITY", ylab="V, NONEXCEEDANCE PROBABILITY")
##D lines(qua.regressCOP(f=0.5, cop=composite2COP, para=para), col=2)
##D lines(qua.regressCOP(f=0.2, cop=composite2COP, para=para), col=2)
##D lines(qua.regressCOP(f=0.7, cop=composite2COP, para=para), col=2)
##D lines(qua.regressCOP(f=0.1, cop=composite2COP, para=para), col=2)
##D lines(qua.regressCOP(f=0.9, cop=composite2COP, para=para), col=2)
##D 
##D med.wrtu <- EMPIRqua.regress(f=0.5, empinv=uv.inv1, lowess=TRUE)
##D lines(med.wrtu, col=2, lwd=4)
##D qua.wrtu <- EMPIRqua.regress(f=0.2, empinv=uv.inv1, lowess=TRUE)
##D lines(qua.wrtu, col=2, lwd=2, lty=2)
##D qua.wrtu <- EMPIRqua.regress(f=0.7, empinv=uv.inv1, lowess=TRUE)
##D lines(qua.wrtu, col=2, lwd=2, lty=2)
##D qua.wrtu <- EMPIRqua.regress(f=0.1, empinv=uv.inv1, lowess=TRUE)
##D lines(qua.wrtu, col=2, lwd=2, lty=4)
##D qua.wrtu <- EMPIRqua.regress(f=0.9, empinv=uv.inv1, lowess=TRUE)
##D lines(qua.wrtu, col=2, lwd=2, lty=4)
##D 
##D lines(qua.regressCOP2(f=0.5, cop=composite2COP, para=para), col=4)
##D lines(qua.regressCOP2(f=0.2, cop=composite2COP, para=para), col=4)
##D lines(qua.regressCOP2(f=0.7, cop=composite2COP, para=para), col=4)
##D lines(qua.regressCOP2(f=0.1, cop=composite2COP, para=para), col=4)
##D lines(qua.regressCOP2(f=0.9, cop=composite2COP, para=para), col=4)
##D 
##D med.wrtv <- EMPIRqua.regress2(f=0.5, empinv=uv.inv2, lowess=TRUE)
##D lines(med.wrtv, col=4, lwd=4)
##D qua.wrtv <- EMPIRqua.regress2(f=0.2, empinv=uv.inv2, lowess=TRUE)
##D lines(qua.wrtv, col=4, lwd=2, lty=2)
##D qua.wrtv <- EMPIRqua.regress2(f=0.7, empinv=uv.inv2, lowess=TRUE)
##D lines(qua.wrtv, col=4, lwd=2, lty=2)
##D qua.wrtv <- EMPIRqua.regress2(f=0.1, empinv=uv.inv2, lowess=TRUE)
##D lines(qua.wrtv, col=4, lwd=2, lty=4)
##D qua.wrtv <- EMPIRqua.regress2(f=0.9, empinv=uv.inv2, lowess=TRUE)
##D lines(qua.wrtv, col=4, lwd=2, lty=4)#
## End(Not run)

## Not run: 
##D  # EXAMPLE 6 (changing the smoothing on the lowess)
##D plot(uv, pch=16, col=rgb(0,0,0,0.1), xlim=c(0,1), ylim=c(0,1),
##D      xlab="U, NONEXCEEDANCE PROBABILITY", ylab="V, NONEXCEEDANCE PROBABILTIY")
##D lines(qua.regressCOP(f=0.5, cop=composite2COP, para=para), col=2)
##D lines(qua.regressCOP(f=0.2, cop=composite2COP, para=para), col=2)
##D lines(qua.regressCOP(f=0.7, cop=composite2COP, para=para), col=2)
##D lines(qua.regressCOP(f=0.1, cop=composite2COP, para=para), col=2)
##D lines(qua.regressCOP(f=0.9, cop=composite2COP, para=para), col=2)
##D 
##D med.wrtu <- EMPIRqua.regress(f=0.5, empinv=uv.inv1, lowess=TRUE, f.lowess=0.1)
##D lines(med.wrtu, col=2, lwd=4)
##D qua.wrtu <- EMPIRqua.regress(f=0.2, empinv=uv.inv1, lowess=TRUE, f.lowess=0.1)
##D lines(qua.wrtu, col=2, lwd=2, lty=2)
##D qua.wrtu <- EMPIRqua.regress(f=0.7, empinv=uv.inv1, lowess=TRUE, f.lowess=0.1)
##D lines(qua.wrtu, col=2, lwd=2, lty=2)
##D qua.wrtu <- EMPIRqua.regress(f=0.1, empinv=uv.inv1, lowess=TRUE, f.lowess=0.1)
##D lines(qua.wrtu, col=2, lwd=2, lty=4)
##D qua.wrtu <- EMPIRqua.regress(f=0.9, empinv=uv.inv1, lowess=TRUE, f.lowess=0.1)
##D lines(qua.wrtu, col=2, lwd=2, lty=4)
##D 
##D lines(qua.regressCOP2(f=0.5, cop=composite2COP, para=para), col=4)
##D lines(qua.regressCOP2(f=0.2, cop=composite2COP, para=para), col=4)
##D lines(qua.regressCOP2(f=0.7, cop=composite2COP, para=para), col=4)
##D lines(qua.regressCOP2(f=0.1, cop=composite2COP, para=para), col=4)
##D lines(qua.regressCOP2(f=0.9, cop=composite2COP, para=para), col=4)
##D 
##D med.wrtv <- EMPIRqua.regress2(f=0.5, empinv=uv.inv2, lowess=TRUE, f.lowess=0.1)
##D lines(med.wrtv, col=4, lwd=4)
##D qua.wrtv <- EMPIRqua.regress2(f=0.2, empinv=uv.inv2, lowess=TRUE, f.lowess=0.1)
##D lines(qua.wrtv, col=4, lwd=2, lty=2)
##D qua.wrtv <- EMPIRqua.regress2(f=0.7, empinv=uv.inv2, lowess=TRUE, f.lowess=0.1)
##D lines(qua.wrtv, col=4, lwd=2, lty=2)
##D qua.wrtv <- EMPIRqua.regress2(f=0.1, empinv=uv.inv2, lowess=TRUE, f.lowess=0.1)
##D lines(qua.wrtv, col=4, lwd=2, lty=4)
##D qua.wrtv <- EMPIRqua.regress2(f=0.9, empinv=uv.inv2, lowess=TRUE, f.lowess=0.1)
##D lines(qua.wrtv, col=4, lwd=2, lty=4)#
## End(Not run)



