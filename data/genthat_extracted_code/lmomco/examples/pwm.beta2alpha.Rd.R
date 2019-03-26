library(lmomco)


### Name: pwm.beta2alpha
### Title: Conversion of Beta to Alpha Probability-Weighted Moments (PWMs)
###   or Alpha to Beta PWMs
### Aliases: pwm.beta2alpha pwm.alpha2beta
### Keywords: probability-weighted moment (theoretical)

### ** Examples

X <- rnorm(100)
pwm(X)$betas
pwm.beta2alpha(pwm(X)$betas)
pwm.alpha2beta(pwm.beta2alpha(pwm(X)$betas))



