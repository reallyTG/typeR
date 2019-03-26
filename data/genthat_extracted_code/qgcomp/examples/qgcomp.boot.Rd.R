library(qgcomp)


### Name: qgcomp.boot
### Title: estimation of quantile g-computation fit, using bootstrap
###   confidence intervals
### Aliases: qgcomp.boot
### Keywords: mixtures variance,

### ** Examples

set.seed(30)
# continuous outcome
dat <- data.frame(y=rnorm(100), x1=runif(100), x2=runif(100), z=runif(100))
# Conditional linear slope
qgcomp.noboot(y ~ z + x1 + x2, expnms = c('x1', 'x2'), data=dat, q=4, family=gaussian())
# Marginal linear slope (population average slope, for a purely linear, 
#  additive model this will equal the conditional)
qgcomp.boot(f=y ~ z + x1 + x2, expnms = c('x1', 'x2'), data=dat, q=4, 
  family=gaussian(), B=10) #increase B to at least 200 in actual examples
  
# Population average mixture slope which accounts for non-linearity and interactions
qgcomp.boot(y ~ z + x1 + x2 + I(x1^2) + I(x2*x1), family="gaussian", 
 expnms = c('x1', 'x2'), data=dat, q=4, B=10)
 
# binary outcome
dat <- data.frame(y=rbinom(50,1,0.5), x1=runif(50), x2=runif(50), z=runif(50))

# Conditional mixture OR
qgcomp.noboot(y ~ z + x1 + x2, family="binomial", expnms = c('x1', 'x2'), 
  data=dat, q=2)
  
#Marginal mixture OR (population average OR - in general, this will not equal the 
# conditional mixture OR due to non-collapsibility of the OR)
qgcomp.boot(y ~ z + x1 + x2, family="binomial", expnms = c('x1', 'x2'), 
  data=dat, q=2, B=10)
  
# Population average mixture RR
qgcomp.boot(y ~ z + x1 + x2, family="binomial", expnms = c('x1', 'x2'), 
  data=dat, q=2, rr=TRUE, B=10)
  
# Population average mixture RR, indicator variable representation of x2
# note that I(x==...) operates on the quantile-based category of x,
# rather than the raw value
res = qgcomp.boot(y ~ z + x1 + I(x2==1) + I(x2==2) + I(x2==3), 
  family="binomial", expnms = c('x1', 'x2'), data=dat, q=4, rr=TRUE, B=10)
res$fit  
plot(res)

# now add in a non-linear MSM
res2 = qgcomp.boot(y ~ z + x1 + I(x2==1) + I(x2==2) + I(x2==3), 
  family="binomial", expnms = c('x1', 'x2'), data=dat, q=4, rr=TRUE, B=10, 
  degree=2)
res2$fit  
res2$msmfit  
plot(res2)
# Log risk ratio per one IQR change in all exposures (not on quantile basis)
dat$x1iqr <- dat$x1/with(dat, diff(quantile(x1, c(.25, .75))))
dat$x2iqr <- dat$x2/with(dat, diff(quantile(x2, c(.25, .75))))
# note that I(x>...) nowoperates on the untransformed value of x,
# rather than the raw value
res2 = qgcomp.boot(y ~ z + x1iqr + I(x2iqr>0.1) + I(x2>0.4) + I(x2>0.9), 
  family="binomial", expnms = c('x1iqr', 'x2iqr'), data=dat, q=NULL, rr=TRUE, B=10, 
  degree=2)
res2



