library(lmomco)


### Name: lmom2pwm
### Title: L-moments to Probability-Weighted Moments
### Aliases: lmom2pwm
### Keywords: L-moment (theoretical) probability-weighted moment
###   (theoretical) probability-weighted moment (L-moments to)

### ** Examples

pwm <- lmom2pwm(lmoms(c(123,34,4,654,37,78)))
lmom2pwm(lmom.ub(rnorm(100)))
lmom2pwm(lmoms(rnorm(100)))

lmomvec1 <- c(1000,1300,0.4,0.3,0.2,0.1)
pwmvec   <- lmom2pwm(lmomvec1)
print(pwmvec)
#$betas
#[1] 1000.0000 1150.0000 1070.0000  984.5000  911.2857
#
#$source
#[1] "lmom2pwm"

lmomvec2 <- pwm2lmom(pwmvec)
print(lmomvec2)
#$lambdas
#[1] 1000 1300  520  390  260
#
#$ratios
#[1]  NA 1.3 0.4 0.3 0.2
#
#$source
#[1] "pwm2lmom"

pwm2lmom(lmom2pwm(list(L1=25, L2=20, TAU3=.45, TAU4=0.2, TAU5=0.1)))



