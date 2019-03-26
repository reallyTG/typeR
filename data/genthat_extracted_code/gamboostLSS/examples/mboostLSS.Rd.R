library(gamboostLSS)


### Name: mboostLSS
### Title: Fitting GAMLSS by Boosting
### Aliases: mboostLSS blackboostLSS glmboostLSS gamboostLSS mboostLSS_fit
### Keywords: models nonlinear fitting

### ** Examples


### Data generating process:
set.seed(1907)
x1 <- rnorm(1000)
x2 <- rnorm(1000)
x3 <- rnorm(1000)
x4 <- rnorm(1000)
x5 <- rnorm(1000)
x6 <- rnorm(1000)
mu    <- exp(1.5 +1 * x1 +0.5 * x2 -0.5 * x3 -1 * x4)
sigma <- exp(-0.4 * x3 -0.2 * x4 +0.2 * x5 +0.4 * x6)
y <- numeric(1000)
for( i in 1:1000)
    y[i] <- rnbinom(1, size = sigma[i], mu = mu[i])
dat <- data.frame(x1, x2, x3, x4, x5, x6, y)

### linear model with y ~ . for both components: 400 boosting iterations
model <- glmboostLSS(y ~ ., families = NBinomialLSS(), data = dat,
                     control = boost_control(mstop = 400),
                     center = TRUE)
coef(model, off2int = TRUE)


### estimate model with different formulas for mu and sigma:
names(NBinomialLSS())      # names of the family

## No test: 
### Do not test the following code per default on CRAN as it takes some time to run:
# Note: Multiple formulas must be specified via a _named list_
#       where the names correspond to the names of the distribution parameters
#       in the family (see above)
model2 <- glmboostLSS(formula = list(mu = y ~ x1 + x2 + x3 + x4,
                                    sigma = y ~ x3 + x4 + x5 + x6),
                     families = NBinomialLSS(), data = dat,
                     control = boost_control(mstop = 400, trace = TRUE),
                     center = TRUE)
coef(model2, off2int = TRUE)
### END (don't test automatically)
## End(No test)


### Offset needs to be specified via the arguments of families object:
model <- glmboostLSS(y ~ ., data = dat,
                     families = NBinomialLSS(mu = mean(mu),
                                             sigma = mean(sigma)),
                     control = boost_control(mstop = 10),
                     center = TRUE)
# Note: mu-offset = log(mean(mu)) and sigma-offset = log(mean(sigma))
#       as we use a log-link in both families
coef(model)
log(mean(mu))
log(mean(sigma))

## No test: 
### Do not test the following code per default on CRAN as it takes some time to run:
### use different mstop values for the two distribution parameters
### (two-dimensional early stopping)
### the number of iterations is passed to boost_control via a named list
model3 <- glmboostLSS(formula = list(mu = y ~ x1 + x2 + x3 + x4,
                                    sigma = y ~ x3 + x4 + x5 + x6),
                     families = NBinomialLSS(), data = dat,
                     control = boost_control(mstop = list(mu = 400,
                                                          sigma = 300),
                                             trace  = TRUE),
                     center = TRUE)
coef(model3, off2int = TRUE)

### Alternatively we can change mstop of model2:
# here it is assumed that the first element in the vector corresponds to
# the first distribution parameter of model2 etc.
mstop(model2) <- c(400, 300)
par(mfrow = c(1,2))
plot(model2, xlim = c(0, max(mstop(model2))))
## all.equal(coef(model2), coef(model3)) # same!
### END (don't test automatically)
## End(No test)



