library(crch)


### Name: crch.boost
### Title: Auxiliary functions to fit 'crch' models via boosting.
### Aliases: crch.boost crch.boost.fit
### Keywords: regression, boosting

### ** Examples

# generate data
set.seed(5)
x <- matrix(rnorm(1000*20),1000,20)
y <- rnorm(1000, 1 + x[,1] - 1.5 * x[,2], exp(-1 + 0.3*x[,3]))
y <- pmax(0, y)
data <- data.frame(cbind(y, x))

# fit model with maximum likelihood
CRCH <- crch(y ~ .|., data = data, dist = "gaussian", left = 0)

# fit model with boosting
boost <- crch(y ~ .|.,  data = data, dist = "gaussian", left = 0,
  control = crch.boost(mstop = "aic"))

# more conveniently, the same model can also be fit through
# boost <- crch(y ~ .|.,  data = data, dist = "gaussian", left = 0,
#   method = "boosting", mstop = "aic")

# AIC comparison
AIC(CRCH, boost)

# summary
summary(boost)

# plot
plot(boost)



