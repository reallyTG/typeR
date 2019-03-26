library(KFAS)


### Name: boat
### Title: Oxford-Cambridge boat race results 1829-2011
### Aliases: boat
### Keywords: datasets

### ** Examples

data("boat")

# Model from DK2012, bernoulli response based on random walk
model <- SSModel(boat ~ SSMtrend(1, Q = NA), distribution = "binomial")

fit_nosim <- fitSSM(model, inits = log(0.25), method = "BFGS", hessian = TRUE)
# nsim set to small for faster execution of example
# doesn't matter here as the model/data is so poor anyway
fit_sim <- fitSSM(model, inits = log(0.25), method = "BFGS", hessian = TRUE, nsim = 100)

# Compare with the results from DK2012
model_DK <- SSModel(boat ~ SSMtrend(1, Q = 0.33), distribution = "binomial")

# Big difference in variance parameters:
fit_nosim$model["Q"]
fit_sim$model["Q"]

# approximate 95% confidence intervals for variance parameter:
# very wide, there really isn't enough information in the data
# as a comparison, a fully Bayesian approach (using BUGS) with [0, 10] uniform prior for sigma
# gives posterior mode for Q as 0.18, and 95% credible interval [0.036, 3.083]

exp(fit_nosim$optim.out$par + c(-1, 1)*qnorm(0.975)*sqrt(1/fit_nosim$optim.out$hessian[1]))
exp(fit_sim$optim.out$par + c(-1, 1)*qnorm(0.975)*sqrt(1/fit_sim$optim.out$hessian[1]))

# 95% confidence intervals for probability that Cambridge wins
pred_nosim <- predict(fit_nosim$model, interval = "confidence")
pred_sim <- predict(fit_sim$model, interval = "confidence")
ts.plot(pred_nosim, pred_sim, col = c(1, 2, 2, 3, 4, 4), lty = c(1, 2, 2), ylim = c(0, 1))
points(x = time(boat), y = boat, pch = 15, cex = 0.5)

# if we trust the approximation, fit_nosim gives largest log-likelihood:
logLik(fit_nosim$model)
logLik(fit_sim$model)
logLik(model_DK)

# and using importance sampling fit_sim is the best:
logLik(fit_nosim$model, nsim = 100)
logLik(fit_sim$model, nsim = 100)
logLik(model_DK, nsim = 100)

## Not run: 
##D # only one unknown parameter, easy to check the shape of likelihood:
##D # very flat, as was expected based on Hessian
##D ll_nosim <- Vectorize(function(x) {
##D   model["Q"] <- x
##D   logLik(model)
##D })
##D ll_sim <- Vectorize(function(x) {
##D   model["Q"] <- x
##D   logLik(model, nsim = 100)
##D })
##D curve(ll_nosim(x), from = 0.1, to = 0.5, ylim = c(-106, -104.5))
##D curve(ll_sim(x), from = 0.1, to = 0.5, add = TRUE, col = "red")
## End(Not run)



