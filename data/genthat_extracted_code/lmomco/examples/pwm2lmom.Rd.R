library(lmomco)


### Name: pwm2lmom
### Title: Probability-Weighted Moments to L-moments
### Aliases: pwm2lmom
### Keywords: L-moment (theoretical) probability-weighted moment
###   (theoretical)

### ** Examples

D <- c(123,34,4,654,37,78)
pwm2lmom(pwm.ub(D))
pwm2lmom(pwm(D))
pwm2lmom(pwm(rnorm(100)))



