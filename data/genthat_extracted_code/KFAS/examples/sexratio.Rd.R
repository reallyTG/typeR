library(KFAS)


### Name: sexratio
### Title: Number of males and females born in Finland from 1751 to 2011
### Aliases: sexratio
### Keywords: datasets

### ** Examples

data("sexratio")
model <- SSModel(Male ~ SSMtrend(1, Q = NA), u = sexratio[, "Total"],
  data = sexratio, distribution = "binomial")
fit <- fitSSM(model, inits = -15, method = "BFGS")
fit$model["Q"]

# Computing confidence intervals in response scale
# Uses importance sampling on response scale (400 samples with antithetics)

pred <- predict(fit$model, type = "response", interval = "conf", nsim = 100)

ts.plot(cbind(model$y/model$u, pred), col = c(1, 2, 3, 3), lty = c(1, 1, 2, 2))

## Not run: 
##D # Now with sex ratio instead of the probabilities:
##D imp <- importanceSSM(fit$model, nsim = 1000, antithetics = TRUE)
##D sexratio.smooth <- numeric(length(model$y))
##D sexratio.ci <- matrix(0, length(model$y), 2)
##D w <- imp$w/sum(imp$w)
##D for(i in 1:length(model$y)){
##D  sexr <- exp(imp$sample[i, 1, ])
##D  sexratio.smooth[i] <- sum(sexr*w)
##D  oo <- order(sexr)
##D  sexratio.ci[i, ] <- c(sexr[oo][which.min(abs(cumsum(w[oo]) - 0.05))],
##D                       sexr[oo][which.min(abs(cumsum(w[oo]) - 0.95))])
##D }
##D 
##D # Same by direct transformation:
##D out <- KFS(fit$model, smoothing = "signal", nsim = 1000)
##D sexratio.smooth2 <- exp(out$thetahat)
##D sexratio.ci2 <- exp(c(out$thetahat) + qnorm(0.025) *
##D   sqrt(drop(out$V_theta))%o%c(1, -1))
##D 
##D ts.plot(cbind(sexratio.smooth, sexratio.ci, sexratio.smooth2, sexratio.ci2),
##D         col = c(1, 1, 1, 2, 2, 2), lty = c(1, 2, 2, 1, 2, 2))
## End(Not run)



