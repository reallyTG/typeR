library(uGMAR)


### Name: predict.gsmar
### Title: Forecast GMAR, StMAR or G-StMAR process
### Aliases: predict.gsmar

### ** Examples

## No test: 
# GMAR model
params12 <- c(1.12, 0.91, 0.29, 4.53, 0.70, 3.21, 0.84)
gmar12 <- GSMAR(VIX, 1, 2, params12)
pred12 <- predict(gmar12, n_ahead=10)
pred12

# Restricted GMAR model, one-step conditional mean prediction
params12r <- c(1.4, 1.8, 0.88, 0.29, 3.18, 0.84)
gmar12r <- GSMAR(data=VIX, p=1, M=2, params=params12r, model="GMAR",
 restricted=TRUE)
pred12r <- predict(gmar12r, pred_type="cond_mean", plotRes=FALSE)
pred12r

# StMAR model, upper confidence intervals
params12t <- c(1.38, 0.88, 0.27, 3.8, 0.74, 3.15, 0.8, 100, 3.6)
stmar12 <- GSMAR(data=VIX, p=1, M=2, params=params12t, model="StMAR")
predict(stmar12, n_ahead=10, ci_type="upper", ci=c(0.99, 0.95, 0.9))

# G-StMAR model, no confidence intervals
params12gs <- c(1.38, 0.88, 0.27, 3.8, 0.74, 3.15, 0.8, 3.6)
gstmar12 <- GSMAR(data=VIX, p=1, M=c(1, 1), params=params12gs,
 model="G-StMAR")
pred12gs <- predict(gstmar12, n_ahead=10, pred_type="median",
 ci_type="none", plotRes=FALSE)
pred12gs
plot(pred12gs)

# GMAR model as a mixture of AR(2) and AR(1) models
constraints <- list(diag(1, ncol=2, nrow=2), as.matrix(c(1, 0)))
params22c <- c(1.2, 0.85, 0.04, 0.3, 3.3, 0.77, 2.8, 0.77)
gmar22c <- GSMAR(data=VIX, p=2, M=2, params=params22c,
 model="GMAR", constraints=constraints)
predict(gmar22c, n_ahead=5, nsimu=10000, nt=10)

# Such StMAR(3,2) that the AR coefficients are restricted to be
# the same for both regimes and that the second AR coefficients are
# constrained to zero.
params32trc <- c(2.2, 1.8, 0.88, -0.03, 2.4, 0.27, 0.40, 3.9, 1000)
stmar32rc <- GSMAR(data=VIX, p=3, M=2, params=params32trc, model="StMAR",
 restricted=TRUE, constraints=matrix(c(1, 0, 0, 0, 0, 1), ncol=2))
predict(stmar32rc, n_ahead=3, ci_type="lower")
## End(No test)



