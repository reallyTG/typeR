library(copBasic)


### Name: EMPIRgridder
### Title: Derivatives of the Grid of the Bivariate Empirical Copula for V
###   with respect to U
### Aliases: EMPIRgridder
### Keywords: empirical copula empirical copula (derivatives) derivative

### ** Examples

## Not run: 
##D para   <- list(alpha=0.15,  beta=0.65, cop1=PLACKETTcop, cop2=PLACKETTcop,
##D                para1=0.005, para2=1000)
##D uv <- simCOP(n=1000, cop=composite2COP, para=para)
##D fakeU <- lmomco::pp(uv[,1], sort=FALSE)
##D fakeV <- lmomco::pp(uv[,2], sort=FALSE)
##D uv <- data.frame(U=fakeU, V=fakeV)
##D 
##D "trans3d" <- function(x,y,z, pmat) {
##D    tmat <- cbind(x,y,z,1) %*% pmat; return(tmat[,1:2] / tmat[,4])
##D }
##D 
##D the.grid <- EMPIRgrid(para=uv, deluv=0.1)
##D the.diag <- diagCOP(cop=EMPIRcop, para=uv, ploton=FALSE, lines=FALSE)
##D empcop <- EMPIRcopdf(para=uv) # data.frame of all points
##D 
##D the.persp <- persp(the.grid$empcop, theta=-25, phi=20,
##D                    xlab="U VARIABLE", ylab="V VARIABLE", zlab="COPULA C(u,v)")
##D points(trans3d(empcop$u, empcop$v, empcop$empcop, the.persp),
##D        col=rgb(0,1-sqrt(empcop$empcop),1,sqrt(empcop$empcop)), pch=16, cex=0.75)
##D 
##D # Now extract the copula sections
##D some.lines <- trans3d(rep(0.2, length(the.grid$v)),
##D                       the.grid$v, the.grid$empcop[3,], the.persp)
##D lines(some.lines, lwd=2, col=2)
##D some.lines <- trans3d(the.grid$u, rep(0.6, length(the.grid$u)),
##D                       the.grid$empcop[,7], the.persp)
##D lines(some.lines, lwd=2, col=3)
##D some.lines <- trans3d(rep(0.7, length(the.grid$v)), the.grid$v,
##D                       the.grid$empcop[8,], the.persp)
##D lines(some.lines, lwd=2, col=6)
##D 
##D # Now compute some derivatives or conditional cumulative
##D # distribution functions
##D empder <- EMPIRgridder(empgrid=the.grid)
##D some.lines <- trans3d(rep(0.2, length(the.grid$v)), the.grid$v, empder[3,], the.persp)
##D lines(some.lines, lwd=4, col=2)
##D 
##D empder <- EMPIRgridder2(empgrid=the.grid)
##D some.lines <- trans3d(the.grid$u, rep(0.6, length(the.grid$u)), empder[,7], the.persp)
##D lines(some.lines, lwd=4, col=3)
##D 
##D empder <- EMPIRgridder(empgrid=the.grid)
##D some.lines <- trans3d(rep(0.7, length(the.grid$v)), the.grid$v, empder[8,], the.persp)
##D lines(some.lines, lwd=4, col=6)
##D 
##D # Demonstrate conditional quantile function extraction for
##D # the 70th percentile of U and see how it plots on top of
##D # the thick purple line
##D empinv <- EMPIRgridderinv(empgrid=the.grid)
##D some.lines <- trans3d(rep(0.7, length(the.grid$v)), empinv[8,],
##D                       attributes(empinv)$colnames, the.persp)
##D lines(some.lines, lwd=4, col=5, lty=2)#
## End(Not run)



