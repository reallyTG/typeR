library(ahaz)


### Name: ahazpen
### Title: Fit penalized semiparametric additive hazards model
### Aliases: ahazpen
### Keywords: models regression survival

### ** Examples

data(sorlie)

# Break ties
set.seed(10101)
time <- sorlie$time+runif(nrow(sorlie))*1e-2

# Survival data + covariates
surv <- Surv(time,sorlie$status)
X <- as.matrix(sorlie[,3:ncol(sorlie)])

# Fit additive hazards regression model
fit1 <- ahazpen(surv, X,penalty="lasso", dfmax=30)
fit1
plot(fit1)

# Extend the grid to contain exactly 100 lambda values
lrange <- range(fit1$lambda)
fit2 <- ahazpen(surv, X,penalty="lasso", lambda.minf=lrange[1]/lrange[2])
plot(fit2)

# User-specified lambda sequence
lambda <- exp(seq(log(0.30), log(0.1), length = 100))
fit2 <- ahazpen(surv, X, penalty="lasso", lambda = lambda)
plot(fit2)

# Advanced usage - specify details of the penalty function
fit4 <- ahazpen(surv, X,penalty=sscad.control(nsteps=2))
fit4
fit5 <- ahazpen(surv, X,penalty=lasso.control(alpha=0.1))
plot(fit5)



