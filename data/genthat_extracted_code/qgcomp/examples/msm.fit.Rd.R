library(qgcomp)


### Name: msm.fit
### Title: fitting marginal structural model (MSM) based on g-computation
###   with quantized exposures
### Aliases: msm.fit
### Keywords: mixtures variance,

### ** Examples

set.seed(50)
dat <- data.frame(y=runif(200), x1=runif(200), x2=runif(200), z=runif(200))
X <- c('x1', 'x2')
qdat <- quantize(dat, X, q=4)$data
mod <- qgcomp:::msm.fit(f=y ~ z + x1 + x2 + I(x1*x2), 
        expnms = c('x1', 'x2'), qdata=qdat, intvals=1:4)
summary(mod$fit) # outcome regression model
summary(mod$msmfit) # msm fit (variance not valid - must be obtained via bootstrap)



