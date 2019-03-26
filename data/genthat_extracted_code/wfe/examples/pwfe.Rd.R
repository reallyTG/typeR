library(wfe)


### Name: pwfe
### Title: Fitting the Weighted Fixed Effects Model with Propensity Score
###   Weighting
### Aliases: pwfe
### Keywords: regression

### ** Examples

### NOTE: this example illustrates the use of wfe function with randomly
### generated panel data with arbitrary number of units and time.

## generate panel data with number of units = N, number of time = Time
## Not run: 
##D 
##D N <- 10 # number of distinct units
##D Time <- 15 # number of distinct time
##D 
##D ## generate treatment variable
##D treat <- matrix(rbinom(N*Time, size = 1, 0.25), ncol = N)
##D ## make sure at least one observation is treated for each unit
##D while ((sum(apply(treat, 2, mean) == 0) > 0) | (sum(apply(treat, 2, mean) == 1) > 0) |
##D        (sum(apply(treat, 1, mean) == 0) > 0) | (sum(apply(treat, 1, mean) == 1) > 0)) {
##D   treat <- matrix(rbinom(N*Time, size = 1, 0.25), ncol = N)
##D }
##D treat.vec <- c(treat)
##D 
##D ## unit fixed effects
##D alphai <- rnorm(N, mean = apply(treat, 2, mean))
##D 
##D ## geneate two random covariates
##D x1 <- matrix(rnorm(N*Time, 0.5,1), ncol=N)
##D x2 <- matrix(rbeta(N*Time, 5,1), ncol=N)
##D pscore <- matrix(runif(N*Time, 0,1), ncol=N)
##D x1.vec <- c(x1)
##D x2.vec <- c(x2)
##D pscore <- c(pscore)
##D 
##D ## generate outcome variable
##D y <- matrix(NA, ncol = N, nrow = Time)
##D for (i in 1:N) {
##D     y[, i] <- alphai[i] + treat[, i] + x1[,i] + x2[,i] + rnorm(Time)
##D }
##D y.vec <- c(y)
##D 
##D ## generate unit and time index
##D unit.index <- rep(1:N, each = Time)
##D time.index <- rep(1:Time, N)
##D 
##D Data.str <- as.data.frame(cbind(y.vec, treat.vec, unit.index, x1.vec, x2.vec))
##D colnames(Data.str) <- c("y", "tr", "strata.id", "x1", "x2")
##D 
##D Data.obs <- as.data.frame(cbind(y.vec, treat.vec, unit.index, time.index, x1.vec, x2.vec, pscore))
##D colnames(Data.obs) <- c("y", "tr", "unit", "time", "x1", "x2", "pscore")
##D 
##D 
##D ############################################################
##D # Example 1: Stratified Randomized Experiments
##D ############################################################
##D 
##D ## run the weighted fixed effect regression with strata fixed effect.
##D ## Note: the quantity of interest is Average Treatment Effect ("ate")
##D ## and the standard errors allow heteroskedasticity and arbitrary
##D ## autocorrelation.
##D 
##D 
##D ### Average Treatment Effect
##D ps.ate <- pwfe(~ x1+x2, treat = "tr", outcome = "y", data = Data.str, 
##D                unit.index = "strata.id", method = "unit", within.unit = TRUE,
##D                qoi = "ate", hetero.se=TRUE, auto.se=TRUE)
##D ## summarize the results
##D summary(ps.ate)
##D 
##D ### Average Treatment Effect for the Treated
##D ps.att <- pwfe(~ x1+x2, treat = "tr", outcome = "y", data = Data.str, 
##D                unit.index = "strata.id", method = "unit", within.unit = TRUE,
##D                qoi = "att", hetero.se=TRUE, auto.se=TRUE)
##D ## summarize the results
##D summary(ps.att)
##D 
##D 
##D ############################################################
##D # Example 2: Observational Studies with Unit Fixed-effects
##D ############################################################
##D 
##D ## run the weighted fixed effect regression with unit fixed effect.
##D ## Note: the quantity of interest is Average Treatment Effect ("ate")
##D ## and the standard errors allow heteroskedasticity and arbitrary
##D ## autocorrelation.
##D 
##D ### Average Treatment Effect
##D ps.obs <- pwfe(~ x1+x2, treat = "tr", outcome = "y", data = Data.obs, 
##D                unit.index = "unit", time.index = "time",
##D                method = "unit", within.unit = TRUE,
##D                qoi = "ate", hetero.se=TRUE, auto.se=TRUE)
##D 
##D ## summarize the results
##D summary(ps.obs)
##D 
##D ## extracting weigths
##D summary(ps.obs)$Weights
##D 
##D ### Average Treatment Effect with First-difference
##D 
##D ps.fd <- pwfe(~ x1+x2, treat = "tr", outcome = "y", data = Data.obs,
##D               unit.index = "unit", time.index = "time",
##D               method = "unit", within.unit = TRUE,
##D               qoi = "ate", estimator = "fd", hetero.se=TRUE, auto.se=TRUE)
##D 
##D ## summarize the results
##D summary(ps.fd)
##D 
##D 
##D ############################################################
##D # Example 3: Estimation with pre-specified propensity score
##D ############################################################
##D 
##D ### Average Treatment Effect with Pre-specified Propensity Scores
##D 
##D mod.ps <- pwfe(treat = "tr", outcome = "y", data = Data.obs, pscore = "pscore",
##D                unit.index = "unit", time.index = "time",
##D                method = "unit", within.unit = TRUE,
##D                qoi = "ate", hetero.se=TRUE, auto.se=TRUE)
##D 
##D ## summarize the results
##D summary(mod.ps)
## End(Not run)




