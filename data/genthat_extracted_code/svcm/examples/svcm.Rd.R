library(svcm)


### Name: svcm
### Title: Fitting space-varying coefficient models
### Aliases: svcm
### Keywords: smooth spatial

### ** Examples

## 2d DT-MRI data
data(brain2d)
X <- matrix(c(0.5, 0.5,   0,   0, 0.5, 0.5,
                0,   0, 0.5, 0.5, 0.5, 0.5,
              0.5, 0.5, 0.5, 0.5,   0,   0,
                0,   0,   0,   0,   1,  -1,
                1,  -1,   0,   0,   0,   0,
                0,   0,   1,  -1,   0,   0), nrow = 6)
##2d grid search for lambda; 60*50*6=18000 parameters (amplitudes) in total
M <- svcm(brain2d, X, knots=c(60, 50), deg=c(1, 1), vsize=c(1.875, 1.875),
          type="SEQ", lambda.init=rep(0.1, 2), search=TRUE,
          method="grid", lower=rep(-5, 2), upper=rep(0, 2), ngrid=10) 
str(M$opt)

## show results
zlim <- range(brain2d, M$fit)
old.par <- par(no.readonly=TRUE) 
par(pin=c(6, 1.2), mfrow=c(3, 1)) 
image(t(matrix(brain2d, nrow=dim(brain2d)[1])), axes=FALSE, zlim=zlim,
      col=grey.colors(256)) 
title("Observations: Six Diffusion Weighted Images")
image(t(matrix(M$fitted, nrow=dim(M$fit)[1])), axes=FALSE, zlim=zlim,
      col=grey.colors(256)) 
title("Fitted Values")
image(t(matrix(M$effects, nrow=dim(M$eff)[1])), axes=FALSE, 
      col=grey.colors(256))
title("Estimated Coefficient Surfaces: Six Elements of the Diffusion Tensor") 
par(old.par)


## 3d DT-MRI data; same regressors as in 2d; fixed global smoothing parameter
data(brain3d)
M3d <- svcm(brain3d, X, knots=c(5, 10, 5), deg=c(1, 1, 1), search=FALSE,
            vsize=c(1.875, 1.875, 4.0), type="TP", lambda.init=1)

## visualize results
zlim <- range(brain3d[,,,1], M3d$fit[,,,1])
old.par <- par(no.readonly = TRUE) 
par(pin=c(1.8, 5), mfrow=c(1, 3))
image(matrix(aperm(brain3d[,,,1], c(2,1,3)), nrow=dim(brain3d)[2]),
      axes=FALSE, zlim=zlim, col=grey.colors(256)) 
title("(a) Obs: 1st DWI")
image(matrix(aperm(M3d$fit[,,,1], c(2,1,3)), nrow=dim(brain3d)[2]),
      axes=FALSE, zlim=zlim, col=grey.colors(256)) 
title("(b) Fits of 1st DWI")
image(matrix(aperm(M3d$eff[,,,1], c(2,1,3)), nrow=dim(brain3d)[2]),
             axes=FALSE, col=grey.colors(256)) 
title("(c) Effects: 1st DT element")
title("Six axial slices of the 1st DWI-transform (a) and its fit (b);
      \n\n(c) corresponds to the first diffusion tensor component.",
       outer=TRUE, line=-5) 
par(old.par)



