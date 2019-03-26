library(TauP.R)


### Name: LinInterp
### Title: Linear Interpolation
### Aliases: LinInterp
### Keywords: misc

### ** Examples

xin = c(1, 2, 3, 3, 4, 5)
yin = c(0, 0, 0, 1, 1, 1)
xout = 3.5

LinInterp(xin, yin, xout, 'all')
LinInterp(xin, yin, xout, 'data')




