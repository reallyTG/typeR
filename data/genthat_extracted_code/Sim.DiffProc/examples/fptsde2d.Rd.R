library(Sim.DiffProc)


### Name: fptsde2d
### Title: Approximate densities and random generation for first passage
###   time in 2-D SDE's
### Aliases: fptsde2d fptsde2d.default summary.fptsde2d print.fptsde2d
###   mean.fptsde2d Median.fptsde2d Mode.fptsde2d quantile.fptsde2d
###   kurtosis.fptsde2d skewness.fptsde2d moment.fptsde2d cv.fptsde2d
###   max.fptsde2d min.fptsde2d dfptsde2d dfptsde2d.default print.dfptsde2d
###   plot.dfptsde2d
### Keywords: fpt sde ts mts

### ** Examples


## dX(t) = 5*(-1-Y(t))*X(t) * dt + 0.5 * dW1(t)          
## dY(t) = 5*(-1-X(t))*Y(t) * dt + 0.5 * dW2(t)
## x0 = 2, y0 = -2, and barrier -3+5*t.
## W1(t) and W2(t) two independent Brownian motion
set.seed(1234)

# SDE's 2d
fx <- expression(5*(-1-y)*x , 5*(-1-x)*y)
gx <- expression(0.5 , 0.5)
mod2d <- snssde2d(drift=fx,diffusion=gx,x0=c(2,-2),M=100)

# boundary

St <- expression(-1+5*t)

# random fpt

out <- fptsde2d(mod2d,boundary=St)
out
summary(out)

# Marginal density 

denM <- dfptsde2d(out,pdf="M")
denM
plot(denM)

# Joint density

denJ <- dfptsde2d(out,pdf="J",n=200,lims=c(0.28,0.4,0.04,0.13))
denJ
plot(denJ)
plot(denJ,display="image")
plot(denJ,display="image",drawpoints=TRUE,cex=0.5,pch=19,col.pt='green')
plot(denJ,display="contour")
plot(denJ,display="contour",color.palette=colorRampPalette(c('white','green','blue','red')))



