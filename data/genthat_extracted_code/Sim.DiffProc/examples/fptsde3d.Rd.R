library(Sim.DiffProc)


### Name: fptsde3d
### Title: Approximate densities and random generation for first passage
###   time in 3-D SDE's
### Aliases: fptsde3d fptsde3d.default summary.fptsde3d print.fptsde3d
###   mean.fptsde3d Median.fptsde3d Mode.fptsde3d quantile.fptsde3d
###   kurtosis.fptsde3d skewness.fptsde3d moment.fptsde3d cv.fptsde3d
###   max.fptsde3d min.fptsde3d dfptsde3d dfptsde3d.default print.dfptsde3d
###   plot.dfptsde3d
### Keywords: fpt sde ts mts

### ** Examples


## dX(t) = 4*(-1-X(t))*Y(t) dt + 0.2 * dW1(t) 
## dY(t) = 4*(1-Y(t)) *X(t) dt + 0.2 * dW2(t) 
## dZ(t) = 4*(1-Z(t)) *Y(t) dt + 0.2 * dW3(t) 
## x0 = 0, y0 = -2, z0 = 0, and barrier -3+5*t.       
## W1(t), W2(t) and W3(t) three independent Brownian motion      
set.seed(1234)

# SDE's 3d

fx <- expression(4*(-1-x)*y, 4*(1-y)*x, 4*(1-z)*y)
gx <- rep(expression(0.2),3)
mod3d <- snssde3d(drift=fx,diffusion=gx,M=500)

# boundary 
St <- expression(-3+5*t)

# random

out <- fptsde3d(mod3d,boundary=St)
out
summary(out)

# Marginal density

denM <- dfptsde3d(out,pdf="M")
denM
plot(denM)

# Multiple isosurfaces
## Not run: 
##D denJ <- dfptsde3d(out,pdf="J")
##D denJ
##D plot(denJ,display="rgl")
## End(Not run)



