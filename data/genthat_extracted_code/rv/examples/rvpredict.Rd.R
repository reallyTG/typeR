library(rv)


### Name: rvpredict
### Title: Generate predictions from models
### Aliases: rvpredict rvpredict.lm
### Keywords: models

### ** Examples


  ## Create some fake data
  n <- 10
  ## Some covariates
  set.seed(1)
  X <- data.frame(x1=rnorm(n, mean=0), x2=rpois(n, 10) - 10)
  y.mean <- (1.0 + 2.0 * X$x1 + 3.0 * X$x2)
  y <- rnorm(n, y.mean, sd=1.5) ## n random numbers
  D <- cbind(data.frame(y=y), X)
  ## Regression model fit
  obj <- lm(y ~ x1 + x2, data=D)
  ## Bayesian estimates
  posterior(obj)
  ## Replications
  y.rep <- rvpredict(obj)
  ## Predictions at the mean of the covariates
  X.pred <- data.frame(x1=mean(X$x1), x2=mean(X$x2))
  y.pred <- rvpredict(obj, newdata=X.pred)
  ## Plot predictions
  plot(y.rep, D$x1)
  points(D$y, D$x1, col="red")
  ## 'Perturb' (add uncertainty to) covariate x1
  X.pred2 <- X
  X.pred2$x1 <- rnorm(n=n, mean=X.pred2$x1, sd=sd(X.pred2$x1))
  y.pred2 <- rvpredict(obj, newdata=X.pred2)




