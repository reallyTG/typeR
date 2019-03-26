library(npbr)


### Name: quad_spline_est
### Title: Quadratic spline frontiers
### Aliases: quad_spline_est
### Keywords: nonparametric optimize

### ** Examples

## Not run: 
##D data("green")
##D x.green <- seq(min(log(green$COST)), max(log(green$COST)), length.out=101)
##D # 1. Unconstrained quadratic spline fits
##D # Optimal number of inter-knot segments via the BIC criterion
##D (kn.bic.green.u<-quad_spline_kn(log(green$COST), 
##D  log(green$OUTPUT), method="u", type="BIC"))
##D # Unconstrained spline estimate
##D y.quad.green.u<-quad_spline_est(log(green$COST), 
##D  log(green$OUTPUT), x.green, kn=kn.bic.green.u, method="u")
##D 
##D # 2. Monotonicity constraint
##D # Optimal number of inter-knot segments via the BIC criterion
##D (kn.bic.green.m<-quad_spline_kn(log(green$COST), 
##D  log(green$OUTPUT), method="m", type="BIC"))
##D # Monotonic splines estimate
##D y.quad.green.m<-quad_spline_est(log(green$COST), 
##D  log(green$OUTPUT), x.green, kn=kn.bic.green.m, method="m") 
##D    
##D # 3. Monotonicity and Concavity constraints
##D # Optimal number of inter-knot segments via the BIC criterion
##D (kn.bic.green.mc<-quad_spline_kn(log(green$COST), 
##D  log(green$OUTPUT), method="mc", type="BIC"))
##D # Monotonic/Concave splines estimate 
##D y.quad.green.mc<-quad_spline_est(log(green$COST), 
##D  log(green$OUTPUT), x.green, kn=kn.bic.green.mc, 
##D  method="mc", all.dea=TRUE)
##D 
##D # Representation 
##D plot(x.green, y.quad.green.u, lty=1, lwd=4, col="green", 
##D  type="l", xlab="log(COST)", ylab="log(OUTPUT)")   
##D lines(x.green, y.quad.green.m, lty=2, lwd=4, col="cyan")
##D lines(x.green, y.quad.green.mc, lwd=4, lty=3, col="magenta")   
##D points(log(OUTPUT)~log(COST), data=green)
##D legend("topleft", col=c("green","cyan","magenta"), 
##D lty=c(1,2,3), legend=c("unconstrained", "monotone", 
##D  "monotone + concave"), lwd=4, cex=0.8) 
## End(Not run)   



