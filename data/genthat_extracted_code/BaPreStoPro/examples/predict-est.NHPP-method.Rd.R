library(BaPreStoPro)


### Name: predict,est.NHPP-method
### Title: Prediction for a non-homogeneous Poisson process
### Aliases: predict,est.NHPP-method

### ** Examples

model <- set.to.class("NHPP", parameter = list(xi = c(5, 1/2)),
               Lambda = function(t, xi) (t/xi[2])^xi[1])
t <- seq(0, 1, by = 0.01)
data <- simulate(model, t = t)
est <- estimate(model, t, data$Times, 1000)  # nMCMC should be much larger!
plot(est)
pred <- predict(est, Lambda.mat = function(t, xi) (t/xi[,2])^xi[,1],
   variable = "PoissonProcess", pred.alg = "Distribution")

## Not run: 
##D pred_NHPP <- predict(est, Lambda.mat = function(t, xi) (t/xi[,2])^xi[,1])
##D pred_NHPP <- predict(est, variable = "PoissonProcess",
##D    Lambda.mat = function(t, xi) (t/xi[,2])^xi[,1])
##D pred_NHPP2 <- predict(est, which.series = "current",
##D    Lambda.mat = function(t, xi) (t/xi[,2])^xi[,1])
##D pred_NHPP3 <- predict(est, variable = "PoissonProcess", which.series = "current",
##D                       Lambda.mat = function(t, xi) (t/xi[,2])^xi[,1])
##D pred_NHPP4 <- predict(est, pred.alg = "simpleTrajectory", M2pred = length(data$Times))
## End(Not run)
pred_NHPP <- predict(est, variable = "PoissonProcess", pred.alg = "simpleTrajectory",
                     M2pred = length(data$Times))
pred_NHPP <- predict(est, variable = "PoissonProcess", pred.alg = "simpleBayesTrajectory",
                     M2pred = length(data$Times), sample.length = 100)



