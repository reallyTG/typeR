library(dcemriS4)


### Name: dcemri.bayes
### Title: Bayesian Methods for Pharmacokinetic Modeling of Dynamic
###   Contrast-Enhanced MRI Data
### Aliases: dcemri.bayes dcemri.bayes,array-method dcemri.bayes.single
### Keywords: models

### ** Examples

data("buckley")
xi <- seq(5, 300, by=5)
img <- array(t(breast$data)[,xi], c(13,1,1,60))
mask <- array(TRUE, dim(img)[1:3])
time <- buckley$time.min[xi]

## Bayesian estimation with Fritz-Hansen default AIF
fit.bayes <- dcemri.bayes(img, time, mask, aif="fritz.hansen",
                         nriters=1000, thin=2, burnin=200)

## Bayesian estimation with "orton.exp" function fit to Buckley's AIF
aif <- buckley$input[xi]
aifparams <- orton.exp.lm(time, aif)
aifparams$D <- 1
fit.bayes.aif <- dcemri.bayes(img, time, mask, model="orton.exp",
                              aif="user", user=aifparams,
                              nriters=1000, thin=2, burnin=200)

plot(breast$ktrans, fit.bayes$ktrans, xlim=c(0,1), ylim=c(0,1),
     xlab=expression(paste("True ", K^{trans})),
     ylab=expression(paste("Estimated ", K^{trans}, " (Bayesian)")))
points(breast$ktrans, fit.bayes.aif$ktrans, pch=2)
abline(0, 1, lwd=2, col=2)
legend("right", c("extended/fritz.hansen","orton.exp/user"), pch=1:2)

fit.lm <- dcemri.lm(img, time, mask, aif="fritz.hansen")
fit.lm.aif <- dcemri.lm(img, time, mask, model="orton.exp", aif="user",
                        user=aifparams)

plot(breast$ktrans, fit.bayes$ktrans, xlim=c(0,1), ylim=c(0,1),
     xlab=expression(paste("True ", K^{trans})),
     ylab=expression(paste("Estimated ", K^{trans})))
points(breast$ktrans, fit.bayes.aif$ktrans, pch=2)
points(breast$ktrans, fit.lm$ktrans, pch=3)
points(breast$ktrans, fit.lm.aif$ktrans, pch=4)
abline(0, 1, lwd=2, col=2)
legend("bottomright", c("Bayesian Estimation (fritz-hansen)",
                        "Bayesian Estimation (orton.exp)",
                        "Levenburg-Marquardt (weinmann/fritz.hansen)",
                        "Levenburg-Marquardt (orton.exp/user)"), pch=1:4)



