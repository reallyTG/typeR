library(svcm)


### Name: resolution
### Title: Re-scaling resolution of SVCM predictors and effects
### Aliases: resolution
### Keywords: smooth spatial

### ** Examples

##DTI data; regressors are given by the diffusion weigthing gradients
data(brain2d)
X <- matrix(c(0.5, 0.5,   0,   0, 0.5, 0.5,
                0,   0, 0.5, 0.5, 0.5, 0.5,
              0.5, 0.5, 0.5, 0.5,   0,   0,
                0,   0,   0,   0,   1,  -1,
                1,  -1,   0,   0,   0,   0,
                0,   0,   1,  -1,   0,   0), nrow = 6)
M <- svcm(brain2d, X, knots=c(60, 50), deg=c(1, 1), vsize=c(1.875,
          1.875), search=TRUE, type="SEQ", lambda.init=rep(0.1, 2),
          lower=rep(-5, 2), upper=rep(0, 2), ngrid=10)
M2 <- resolution(X, M, fac=c(2, 2))

##show data extract at original and double resolution
extract <- list(M$fit[21:40, 21:60, 1],
                M2$fit[(21*2):(40*2), (21*2):(60*2), 1], 
                M$eff[21:40, 21:60, 1],
                M2$eff[(21*2):(40*2), (21*2):(60*2), 1]) 
zlim1 <- range(extract[[1]], extract[[2]])
zlim2 <- range(extract[[3]], extract[[4]])
old.par <- par(no.readonly = TRUE) 
par(pin=c(3*1, 3*0.67), mfrow=c(2, 2)) 
image(t(extract[[1]]), axes=FALSE, zlim=zlim1, col=grey.colors(256))
title("Fitted Values")
image(t(extract[[2]]), axes=FALSE, zlim=zlim1, col=grey.colors(256))
title("Fitted Values at Double Resolution")
image(t(extract[[3]]), axes=FALSE, zlim=zlim2, col=grey.colors(256))
title("Estimated VC Surface (1st DT element)")
image(t(extract[[4]]), axes=FALSE, zlim=zlim2, col=grey.colors(256))
title("VC Surface at Double Resolution")
par(old.par)



