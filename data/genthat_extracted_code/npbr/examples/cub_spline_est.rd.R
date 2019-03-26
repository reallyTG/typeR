library(npbr)


### Name: cub_spline_est
### Title: Cubic spline fitting
### Aliases: cub_spline_est
### Keywords: nonparametric optimize

### ** Examples

data("air")
x.air <- seq(min(air$xtab), max(air$xtab), length.out=101)
 
# 1. Unconstrained cubic spline fits
# Optimal number of inter-knot segments via the BIC criterion
(kn.bic.air.u<-cub_spline_kn(air$xtab, air$ytab, 
 method="u", type="BIC"))
# Unconstrained spline estimate
y.cub.air.u<-cub_spline_est(air$xtab, air$ytab, 
 x.air, kn=kn.bic.air.u, method="u")

# 2. Monotonicity constraint
# Optimal number of inter-knot segments via the BIC criterion
(kn.bic.air.m<-cub_spline_kn(air$xtab, air$ytab, 
 method="m", type="BIC")) 
# Monotonic splines estimate
y.cub.air.m<-cub_spline_est(air$xtab, air$ytab, 
 x.air, kn=kn.bic.air.m, method="m")
   
# 3. Monotonicity and Concavity constraints
# Optimal number of inter-knot segments via the BIC criterion
(kn.bic.air.mc<-cub_spline_kn(air$xtab, air$ytab, 
 method="mc", type="BIC"))
# Monotonic/Concave splines estimate 
y.cub.air.mc<-cub_spline_est(air$xtab, air$ytab, 
 x.air, kn=kn.bic.air.mc, method="mc", all.dea=TRUE)

# Representation 
plot(x.air, y.cub.air.u, lty=1, lwd=4, col="green", 
 type="l", xlab="log(COST)", ylab="log(OUTPUT)")   
lines(x.air, y.cub.air.m, lty=2, lwd=4, col="cyan")
lines(x.air, y.cub.air.mc, lty=3, lwd=4, col="magenta")   
points(ytab~xtab, data=air)
legend("topleft", col=c("green","cyan","magenta"), 
lty=c(1,2,3), legend=c("unconstrained", "monotone", 
 "monotone + concave"), lwd=4, cex=0.8)    



