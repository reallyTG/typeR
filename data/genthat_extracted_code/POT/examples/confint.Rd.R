library(POT)


### Name: confint.uvpot
### Title: Generic Function to Compute (Profile) Confidence Intervals
### Aliases: confint.uvpot
### Keywords: htest

### ** Examples

x <- rgpd(100, 0, 1, 0.25)
mle <- fitgpd(x, 0)
confint(mle, prob = 0.2)
confint(mle, parm = "shape")



