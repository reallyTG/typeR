library(lmomco)


### Name: pwm.pp
### Title: Plotting-Position Sample Probability-Weighted Moments
### Aliases: pwm.pp
### Keywords: probability-weighted moment (sample)

### ** Examples

pwm <- pwm.pp(rnorm(20), A=-0.35, B=0)

X <- rnorm(20)
pwm <- pwm.pp(X, pp=pp(X)) # weibull plotting positions



