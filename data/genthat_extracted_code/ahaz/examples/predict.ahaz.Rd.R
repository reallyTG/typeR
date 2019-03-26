library(ahaz)


### Name: predict.ahaz
### Title: Prediction methods for ahaz
### Aliases: predict.ahaz coef.ahaz vcov.ahaz residuals.ahaz
### Keywords: methods

### ** Examples

data(sorlie)

set.seed(10101)

# Break ties
time <- sorlie$time+runif(nrow(sorlie))*1e-2

# Survival data + covariates
surv <- Surv(time,sorlie$status)
X <- as.matrix(sorlie[,15:24])

# Fit additive hazards regression model
fit <- ahaz(surv, X)

# Parameter estimates
coef(fit)

# Linear predictor, equivalent to X%*%coef(fit)
predict(fit,type="lp")

# Cumulative baseline hazard
cumahaz <- predict(fit, type="cumhaz")

# Residuals - model fit
resid <- predict(fit, type = "residuals")
# Decorrelate, standardize, and check QQ-plots
stdres <- apply(princomp(resid)$scores,2,function(x){x/sd(x)})
par(mfrow = c(2,2))
for(i in 1:4){
  qqnorm(stdres[,i])
  abline(c(0,1))
}

# Residuals - alternative variance estimation
resid <- residuals(fit)
cov1 <- summary(fit)$coef[,2]
invD <- solve(fit$D)
Best<-t(resid)%*%resid
cov2 <- invD %*% Best %*% invD
# Compare with (nonrobust) SEs from 'summary.ahaz'
plot(cov1, sqrt(diag(cov2)),xlab="Nonrobust",ylab="Robust")
abline(c(0,1))



