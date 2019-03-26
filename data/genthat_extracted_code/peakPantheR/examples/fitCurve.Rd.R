library(peakPantheR)


### Name: fitCurve
### Title: Curve fitting using minpack.lm
### Aliases: fitCurve

### ** Examples

## Not run: 
##D ## x is retention time, y corresponding intensity
##D input_x  <- c(3362.102, 3363.667, 3365.232, 3366.797, 3368.362, 3369.927, 3371.492, 3373.057,
##D              3374.622, 3376.187, 3377.752, 3379.317, 3380.882, 3382.447, 3384.012, 3385.577,
##D              3387.142, 3388.707, 3390.272, 3391.837, 3393.402, 3394.966, 3396.531, 3398.096,
##D              3399.661, 3401.226, 3402.791, 3404.356, 3405.921, 3407.486, 3409.051)
##D input_y  <- c(51048, 81568, 138288, 233920, 376448, 557288, 753216, 938048, 1091840, 1196992,
##D               1261056, 1308992, 1362752, 1406592, 1431360, 1432896, 1407808, 1345344, 1268480,
##D               1198592, 1126848, 1036544, 937600, 849792, 771456, 692416, 614528, 546088, 492752,
##D               446464, 400632)
##D 
##D ## Fit
##D fitted_curve <- fitCurve(input_x, input_y, curveModel='skewedGaussian', params='guess')
##D 
##D ## Returns the optimal fitting parameters
##D fitted_curve
##D #
##D # $amplitude
##D # [1] 275371.1
##D # 
##D # $center
##D # [1] 3382.577
##D # 
##D # $sigma
##D # [1] 0.07904697
##D # 
##D # $gamma
##D # [1] 0.001147647
##D # 
##D # $fitStatus
##D # [1] 2
##D # 
##D # $curveModel
##D # [1] "skewedGaussian"
##D #
##D # attr(,"class")
##D # [1] "peakPantheR_curveFit"
## End(Not run)



