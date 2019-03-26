library(Hmisc)


### Name: transace
### Title: Additive Regression and Transformations using ace or avas
### Aliases: transace areg.boot print.areg.boot plot.areg.boot
###   predict.areg.boot summary.areg.boot print.summary.areg.boot
###   Function.areg.boot Mean Mean.areg.boot Quantile Quantile.areg.boot
###   monotone smearingEst
### Keywords: nonparametric smooth multivariate nonlinear regression

### ** Examples

# xtrans <- transace(cbind(age,sex,blood.pressure,race.code),
#                    binary='sex', monotonic='age',
#                    categorical='race.code')


# Generate random data from the model y = exp(x1 + epsilon/3) where
# x1 and epsilon are Gaussian(0,1)
set.seed(171)  # to be able to reproduce example
x1 <- rnorm(200)
x2 <- runif(200)  # a variable that is really unrelated to y]
x3 <- factor(sample(c('cat','dog','cow'), 200,TRUE))  # also unrelated to y
y  <- exp(x1 + rnorm(200)/3)
f  <- areg.boot(y ~ x1 + x2 + x3, B=40)
f
plot(f)
# Note that the fitted transformation of y is very nearly log(y)
# (the appropriate one), the transformation of x1 is nearly linear,
# and the transformations of x2 and x3 are essentially flat 
# (specifying monotone(x2) if method='avas' would have resulted
# in a smaller confidence band for x2)


summary(f)


# use summary(f, values=list(x2=c(.2,.5,.8))) for example if you
# want to use nice round values for judging effects


# Plot Y hat vs. Y (this doesn't work if there were NAs)
plot(fitted(f), y)  # or: plot(predict(f,statistic='fitted'), y)


# Show fit of model by varying x1 on the x-axis and creating separate
# panels for x2 and x3.  For x2 using only a few discrete values
newdat <- expand.grid(x1=seq(-2,2,length=100),x2=c(.25,.75),
                      x3=c('cat','dog','cow'))
yhat <- predict(f, newdat, statistic='fitted')  
# statistic='mean' to get estimated mean rather than simple inverse trans.
xYplot(yhat ~ x1 | x2, groups=x3, type='l', data=newdat)


## Not run: 
##D # Another example, on hypothetical data
##D f <- areg.boot(response ~ I(age) + monotone(blood.pressure) + race)
##D # use I(response) to not transform the response variable
##D plot(f, conf.int=.9)
##D # Check distribution of residuals
##D plot(fitted(f), resid(f))
##D qqnorm(resid(f))
##D # Refit this model using ols so that we can draw a nomogram of it.
##D # The nomogram will show the linear predictor, median, mean.
##D # The last two are smearing estimators.
##D Function(f, type='individual')  # create transformation functions
##D f.ols <- ols(.response(response) ~ age + 
##D              .blood.pressure(blood.pressure) + .race(race))
##D # Note: This model is almost exactly the same as f but there
##D # will be very small differences due to interpolation of
##D # transformations
##D meanr <- Mean(f)      # create function of lp computing mean response
##D medr  <- Quantile(f)  # default quantile is .5
##D nomogram(f.ols, fun=list(Mean=meanr,Median=medr))
##D 
##D 
##D # Create S functions that will do the transformations
##D # This is a table look-up with linear interpolation
##D g <- Function(f)
##D plot(blood.pressure, g$blood.pressure(blood.pressure))
##D # produces the central curve in the last plot done by plot(f)
## End(Not run)


# Another simulated example, where y has a log-normal distribution
# with mean x and variance 1.  Untransformed y thus has median
# exp(x) and mean exp(x + .5sigma^2) = exp(x + .5)
# First generate data from the model y = exp(x + epsilon),
# epsilon ~ Gaussian(0, 1)


set.seed(139)
n <- 1000
x <- rnorm(n)
y <- exp(x + rnorm(n))
f <- areg.boot(y ~ x, B=20)
plot(f)       # note log shape for y, linear for x.  Good!
xs <- c(-2, 0, 2)
d <- data.frame(x=xs)
predict(f, d, 'fitted')
predict(f, d, 'median')   # almost same; median residual=-.001
exp(xs)                   # population medians
predict(f, d, 'mean')
exp(xs + .5)              # population means


# Show how smearingEst works
res <- c(-1,0,1)          # define residuals
y <- 1:5
ytrans <- log(y)
ys <- seq(.1,15,length=50)
trans.approx <- list(x=log(ys), y=ys)
options(digits=4)
smearingEst(ytrans, exp, res, 'fitted')          # ignores res
smearingEst(ytrans, trans.approx, res, 'fitted') # ignores res 
smearingEst(ytrans, exp, res, 'median')          # median res=0
smearingEst(ytrans, exp, res+.1, 'median')       # median res=.1
smearingEst(ytrans, trans.approx, res, 'median')
smearingEst(ytrans, exp, res, 'mean')
mean(exp(ytrans[2] + res))                       # should equal 2nd # above
smearingEst(ytrans, trans.approx, res, 'mean')
smearingEst(ytrans, trans.approx, res, mean)
# Last argument can be any statistical function operating
# on a vector that returns a single value



