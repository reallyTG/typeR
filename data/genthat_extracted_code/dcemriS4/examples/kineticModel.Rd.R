library(dcemriS4)


### Name: kineticModel
### Title: Pharmacokinetic Models
### Aliases: kineticModel
### Keywords: models

### ** Examples

data("buckley")
xi <- seq(5, 300, by=5)
img <- array(t(breast$data)[,xi], c(13,1,1,60))
mask <- array(TRUE, dim(img)[1:3])
time <- buckley$time.min[xi]

fit.lm <- dcemri.lm(img, time, mask, aif="fritz.hansen")
par.lm <- c("vp"=fit.lm$vp[3], "ktrans"=fit.lm$ktrans[3], "kep"=fit.lm$kep[3])
curve.lm <- kineticModel(time, par.lm)
plot(time, img[3,1,1,], xlab="time", ylab="contrast agent concentration")
lines(time, curve.lm, lwd=2, col=2)

fit.bayes <- dcemri.bayes(img, time, mask, aif="fritz.hansen")
par.bayes <- c("vp"=fit.bayes$vp[3], "ktrans"=fit.bayes$ktrans[3],
               "kep"=fit.bayes$kep[3])
curve.bayes <- kineticModel(time, par.bayes)
lines(time, curve.bayes, lwd=2, col=4)
legend("bottomright", c("Levenburg-Marquardt (extended/fritz.hansen)",
                        "Bayesian Estimation (extended/fritz-hansen)"),
       lwd=2, col=c(2,4))
cbind(time, img[3,,,], curve.lm, curve.bayes)[20:30,]



