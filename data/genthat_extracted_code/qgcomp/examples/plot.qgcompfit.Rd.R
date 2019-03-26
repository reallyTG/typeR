library(qgcomp)


### Name: plot.qgcompfit
### Title: plot.qgcompfit: default plotting method for a qgcompfit object
### Aliases: plot.qgcompfit

### ** Examples

set.seed(12)
dat <- data.frame(x1=(x1 <- runif(100)), x2=runif(100), x3=runif(100), z=runif(100),
                  y=runif(100)+x1+x1^2)
ft <- qgcomp.noboot(y ~ z + x1 + x2 + x3, expnms=c('x1','x2','x3'), data=dat, q=4)
ft
plot(ft)
# examinging fit
plot(ft$fit, which=1) # residual vs. fitted is not straight line!

# using non-linear outcome model
ft2 <- qgcomp.boot(y ~ z + x1 + x2 + x3 + I(x1*x1), expnms=c('x1','x2','x3'), 
data=dat, q=4, B=10)
ft2
plot(ft2$fit, which=1) # much better looking fit diagnostics suggests
# it is better to include interaction term for x
plot(ft2) # the msm predictions don't match up with a smooth estimate
# of the expected outcome, so we should consider a non-linear MSM
# using non-linear marginal structural model
ft3 <- qgcomp.boot(y ~ z + x1 + x2 + x3 + I(x1*x1), expnms=c('x1','x2','x3'), 
data=dat, q=4, B=10, degree=2)
# plot(ft3$fit, which=1) - not run - this is identical to ft2 fit
plot(ft3) # the MSM estimates look much closer to the smoothed estimates
# suggesting the non-linear MSM fits the data better and should be used
# for inference about the effect of the exposure



