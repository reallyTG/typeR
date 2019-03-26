library(peakPantheR)


### Name: predictCurve
### Title: Predict curve values
### Aliases: predictCurve

### ** Examples

## Not run: 
##D ## Input a fitted curve
##D fittedCurve <- list(amplitude=275371.1, center=3382.577, sigma=0.07904697, gamma=0.001147647,
##D                     fitStatus=2, curveModel="skewedGaussian")
##D class(fittedCurve)  <- 'peakPantheR_curveFit'
##D input_x     <- c(3290, 3300, 3310, 3320, 3330, 3340, 3350, 3360, 3370, 3380, 3390, 3400, 3410)
##D 
##D ## Predict y at each input_x
##D pred_y      <- predictCurve(fittedCurve, input_x)
##D pred_y
##D # [1] 2.347729e-08 1.282668e-05 3.475590e-03 4.676579e-01 3.129420e+01 1.043341e+03 1.736915e+04
##D # [8] 1.447754e+05 6.061808e+05 1.280037e+06 1.369651e+06 7.467333e+05 2.087477e+05
## End(Not run)



