library(dcemriS4)


### Name: dcemri.map
### Title: Pharmacokinetic Modeling of Dynamic Contrast-Enhanced MRI Data
### Aliases: dcemri.map dcemri.map,array-method
### Keywords: models

### ** Examples

data("buckley")
xi <- seq(5, 300, by=5)
img <- array(t(breast$data)[,xi], c(13,1,1,60))
mask <- array(TRUE, dim(img)[1:3])
time <- buckley$time.min[xi]

## MAP estimation with extended Kety model and Fritz-Hansen default AIF
fit.map.vp <- dcemri.map(img, time, mask, aif="fritz.hansen")
## Nonlinear regression with extended Kety model and Fritz-Hansen default AIF
fit.lm.vp <- dcemri.lm(img, time, mask, aif="fritz.hansen")

plot(breast$ktrans, fit.map.vp$ktrans, xlim=c(0,1), ylim=c(0,1),
     xlab=expression(paste("True ", K^{trans})),
     ylab=expression(paste("Estimated ", K^{trans})))
points(breast$ktrans, fit.lm.vp$ktrans, pch=3)
abline(0, 1, lwd=2, col=2)
legend("bottomright", c("MAP Estimation (fritz.hansen)",
                        "Levenburg-Marquardt (fritz.hansen)"), pch=c(1,3))

## MAP estimation with Kety model and Fritz-Hansen default AIF
fit.map <- dcemri.map(img, time, mask, model="weinmann", aif="fritz.hansen")
## Nonlinear regression with Kety model and Fritz-Hansen default AIF
fit.lm <- dcemri.lm(img, time, mask, model="weinmann", aif="fritz.hansen")

cbind(breast$kep, fit.lm$kep[,,1], fit.lm.vp$kep[,,1], fit.map$kep[,,1],
      fit.map.vp$kep[,,1])
cbind(breast$ktrans, fit.lm$ktrans[,,1], fit.lm.vp$ktrans[,,1],
      fit.map$ktrans[,,1], fit.map.vp$ktrans[,,1])



