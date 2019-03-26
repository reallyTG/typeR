library(KFAS)


### Name: importanceSSM
### Title: Importance Sampling of Exponential Family State Space Model
### Aliases: importanceSSM

### ** Examples

data("sexratio")
model <- SSModel(Male ~ SSMtrend(1, Q = list(NA)), u = sexratio[,"Total"], data = sexratio,
                distribution = "binomial")
fit <- fitSSM(model, inits = -15, method = "BFGS")
fit$model$Q #1.107652e-06
# Computing confidence intervals for sex ratio
# Uses importance sampling on response scale (1000 samples with antithetics)
set.seed(1)
imp <- importanceSSM(fit$model, nsim = 250, antithetics = TRUE)
sexratio.smooth <- numeric(length(model$y))
sexratio.ci <- matrix(0, length(model$y), 2)
w <- imp$w/sum(imp$w)
for(i in 1:length(model$y)){
  sexr <- exp(imp$sample[i,1,])
  sexratio.smooth[i]<-sum(sexr*w)
  oo <- order(sexr)
  sexratio.ci[i,] <- c(sexr[oo][which.min(abs(cumsum(w[oo]) - 0.05))],
                   sexr[oo][which.min(abs(cumsum(w[oo]) - 0.95))])
}

## Not run: 
##D # Filtered estimates
##D impf <- importanceSSM(fit$model, nsim = 250, antithetics = TRUE,filtered=TRUE)
##D sexratio.filter <- rep(NA,length(model$y))
##D sexratio.fci <- matrix(NA, length(model$y), 2)
##D w <- impf$w/rowSums(impf$w)
##D for(i in 2:length(model$y)){
##D   sexr <- exp(impf$sample[i,1,])
##D   sexratio.filter[i] <- sum(sexr*w[i,])
##D   oo<-order(sexr)
##D   sexratio.fci[i,] <- c(sexr[oo][which.min(abs(cumsum(w[i,oo]) - 0.05))],
##D                     sexr[oo][which.min(abs(cumsum(w[i,oo]) - 0.95))])
##D }
##D 
##D ts.plot(cbind(sexratio.smooth,sexratio.ci,sexratio.filter,sexratio.fci),
##D         col=c(1,1,1,2,2,2),lty=c(1,2,2,1,2,2))
## End(Not run)



