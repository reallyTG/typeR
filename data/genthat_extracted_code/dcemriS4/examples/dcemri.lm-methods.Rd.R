library(dcemriS4)


### Name: dcemri.lm
### Title: Pharmacokinetic Models for Dynamic Contrast-Enhanced MRI Data
### Aliases: dcemri.lm dcemri.lm,array-method
### Keywords: models

### ** Examples

data("buckley")

## Empirical arterial input function
img <- array(t(breast$data), c(13,1,1,301))
time <- buckley$time.min
mask <- array(TRUE, dim(img)[1:3])

## Estimate kinetic parameters directly from Buckley's empirical AIF
fit1 <- dcemri.lm(img, time, mask, model="weinmann", aif="empirical",
                  user=buckley$input)
fit2 <- dcemri.lm(img, time, mask, model="extended", aif="empirical",
                  user=buckley$input)

## Set up breast data for dcemri
xi <- seq(5, 300, by=3)
img <- array(t(breast$data)[,xi], c(13,1,1,length(xi)))
time <- buckley$time.min[xi]
input <- buckley$input[xi]

## Generate AIF params using the orton.exp function from Buckley's AIF
(aifparams <- orton.exp.lm(time, input))
fit3 <- dcemri.lm(img, time, mask, model="orton.exp", aif="user",
                  user=aifparams)

## Scatterplot comparing true and estimated Ktrans values
plot(breast$ktrans, fit1$ktrans, xlim=c(0,0.75), ylim=c(0,0.75),
     xlab=expression(paste("True ", K^{trans})),
     ylab=expression(paste("Estimated ", K^{trans})))
points(breast$ktrans, fit2$ktrans, pch=2)
points(breast$ktrans, fit3$ktrans, pch=3)
abline(0, 1, lwd=1.5, col=2)
legend("bottomright", c("weinmann/empirical", "extended/empirical",
                        "orton.exp/user"), pch=1:3)
cbind(breast$ktrans, fit1$ktrans[,,1], fit2$ktrans[,,1], fit3$ktrans[,,1])

## Scatterplot comparing true and estimated Ktrans values
plot(breast$vp, fit1$vp, type="n", xlim=c(0,0.15), ylim=c(0,0.15),
     xlab=expression(paste("True ", v[p])),
     ylab=expression(paste("Estimated ", v[p])))
points(breast$vp, fit2$vp, pch=2)
points(breast$vp, fit3$vp, pch=3)
abline(0, 1, lwd=1.5, col=2)
legend("bottomright", c("extended/empirical","orton.exp/user"), pch=2:3)
cbind(breast$vp, fit2$vp[,,1], fit3$vp[,,1])



