library(npbr)


### Name: poly_est
### Title: Polynomial frontier estimators
### Aliases: poly_est
### Keywords: optimize

### ** Examples

data("air")
x.air <- seq(min(air$xtab), max(air$xtab), 
 length.out = 101)
# Optimal polynomial degrees via the AIC criterion
(p.aic.air <- poly_degree(air$xtab, air$ytab, 
 type = "AIC"))
# Polynomial boundaries estimate 
y.poly.air<-poly_est(air$xtab, air$ytab, x.air, 
 deg = p.aic.air)
# Representation
plot(x.air, y.poly.air, lty = 1, lwd = 4, 
 col = "magenta", type = "l")
points(ytab~xtab, data = air)  
legend("topleft",legend = paste("degree =", p.aic.air), 
 col = "magenta", lwd = 4, lty = 1)  



