library(CBPS)


### Name: CBPS
### Title: Covariate Balancing Propensity Score (CBPS) Estimation
### Aliases: CBPS

### ** Examples


###
### Example: propensity score matching
###

##Load the LaLonde data
data(LaLonde)
## Estimate CBPS
fit <- CBPS(treat ~ age + educ + re75 + re74 + 
			I(re75==0) + I(re74==0), 
			data = LaLonde, ATT = TRUE)
summary(fit)
## Not run: 
##D ## matching via MatchIt: one to one nearest neighbor with replacement
##D library(MatchIt)
##D m.out <- matchit(treat ~ fitted(fit), method = "nearest", 
##D 				 data = LaLonde, replace = TRUE)
##D 
##D ### Example: propensity score weighting 
##D ###
##D ## Simulation from Kang and Shafer (2007).
##D set.seed(123456)
##D n <- 500
##D X <- mvrnorm(n, mu = rep(0, 4), Sigma = diag(4))
##D prop <- 1 / (1 + exp(X[,1] - 0.5 * X[,2] + 
##D 			 0.25*X[,3] + 0.1 * X[,4]))
##D treat <- rbinom(n, 1, prop)
##D y <- 210 + 27.4*X[,1] + 13.7*X[,2] + 13.7*X[,3] + 13.7*X[,4] + rnorm(n)
##D 
##D ##Estimate CBPS with a misspecified model
##D X.mis <- cbind(exp(X[,1]/2), X[,2]*(1+exp(X[,1]))^(-1)+10, 
##D 			  (X[,1]*X[,3]/25+.6)^3, (X[,2]+X[,4]+20)^2)
##D fit1 <- CBPS(treat ~ X.mis, ATT = 0)
##D summary(fit1)
##D 	
##D ## Horwitz-Thompson estimate
##D mean(treat*y/fit1$fitted.values)
##D ## Inverse propensity score weighting
##D sum(treat*y/fit1$fitted.values)/sum(treat/fit1$fitted.values)
##D 
##D rm(list=c("y","X","prop","treat","n","X.mis","fit1"))
##D 
##D ### Example: Continuous Treatment
##D set.seed(123456)
##D n <- 1000
##D X <- mvrnorm(n, mu = rep(0,2), Sigma = diag(2))
##D beta <- rnorm(ncol(X)+1, sd = 1)
##D treat <- cbind(1,X)%*%beta + rnorm(n, sd = 5)
##D 
##D treat.effect <- 1
##D effect.beta <- rnorm(ncol(X))
##D y <- rbinom(n, 1, (1 + exp(-treat.effect*treat - 
##D 				   X%*%effect.beta))^-1)
##D 
##D fit2 <- CBPS(treat ~ X)
##D summary(fit2)
##D summary(glm(y ~ treat + X, weights = fit2$weights, 
##D 			family = "quasibinomial"))
##D 
##D rm(list=c("n", "X", "beta", "treat", "treat.effect",
##D 		  "effect.beta", "y", "fit2"))
##D 
##D ### Simulation example: Improved CBPS (or iCBPS) from Fan et al
##D set.seed(123456)
##D n <- 500
##D X <- mvrnorm(n, mu = rep(0, 4), Sigma = diag(4))
##D prop <- 1 / (1 + exp(X[,1] - 0.5 * X[,2] + 0.25*X[,3] + 0.1 * X[,4]))
##D treat <- rbinom(n, 1, prop)
##D y1 <- 210 + 27.4*X[,1] + 13.7*X[,2] + 13.7*X[,3] + 13.7*X[,4] + rnorm(n)
##D y0 <- 210 + 13.7*X[,2] + 13.7*X[,3] + 13.7*X[,4] + rnorm(n)
##D ##Estimate iCBPS with a misspecificied model
##D X.mis <- cbind(exp(X[,1]/2), X[,2]*(1+exp(X[,1]))^(-1)+10, 
##D 			   (X[,1]*X[,3]/25+.6)^3, (X[,2]+X[,4]+20)^2)
##D fit1 <- CBPS(treat ~ X.mis, baseline.formula=~X.mis[,2:4], 
##D 			 diff.formula=~X.mis[,1], ATT = FALSE)
##D summary(fit1)
## End(Not run)




