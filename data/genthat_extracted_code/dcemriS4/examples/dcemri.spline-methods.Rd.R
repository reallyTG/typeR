library(dcemriS4)


### Name: dcemri.spline
### Title: Bayesian P-Splines for Dynamic Contrast-Enhanced MRI Data
### Aliases: dcemri.spline dcemri.spline,array-method dcemri.spline.single
### Keywords: models

### ** Examples

data("buckley")
xi <- seq(5, 300, by=5)
img <- array(t(breast$data)[,xi], c(13,1,1,60))
mask <- array(TRUE, dim(img)[1:3])
time <- buckley$time.min[xi]

## Generate AIF params using the orton.exp function from Buckley's AIF
aif <- buckley$input[xi]

fit.spline <- dcemri.spline(img, time, mask, aif="fritz.hansen",
                            nriters=125, thin=3, burnin=25, nlr=TRUE)
fit.spline.aif <- dcemri.spline(img, time, mask, aif="observed",
                                aif.observed=aif, nriters=125, thin=3,
                                burnin=25, nlr=TRUE)

plot(breast$ktrans, fit.spline$ktrans, xlim=c(0,1), ylim=c(0,1),
     xlab=expression(paste("True ", K^{trans})),
     ylab=expression(paste("Estimated ", K^{trans})))
points(breast$ktrans, fit.spline.aif$ktrans, pch=2)
abline(0, 1, lwd=1.5, col="red")
legend("right", c("fritz.hansen", "observed"), pch=1:2)



