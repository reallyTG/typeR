library(wfe)


### Name: wfe
### Title: Fitting the Weighted Fixed Effects Model for Causal Inference
### Aliases: wfe
### Keywords: regression

### ** Examples

### NOTE: this example illustrates the use of wfe function with randomly
### generated panel data with arbitrary number of units and time.

## generate panel data with number of units = N, number of time = Time
N <- 10 # number of distinct units
Time <- 15 # number of distinct time

## treatment effect
beta <- 1

## generate treatment variable
treat <- matrix(rbinom(N*Time, size = 1, 0.25), ncol = N)
## make sure at least one observation is treated for each unit
while ((sum(apply(treat, 2, mean) == 0) > 0) | (sum(apply(treat, 2, mean) == 1) > 0) |
       (sum(apply(treat, 1, mean) == 0) > 0) | (sum(apply(treat, 1, mean) == 1) > 0)) {
  treat <- matrix(rbinom(N*Time, size = 1, 0.25), ncol = N)
}
treat.vec <- c(treat)

## unit fixed effects
alphai <- rnorm(N, mean = apply(treat, 2, mean))

## geneate two random covariates
x1 <- matrix(rnorm(N*Time, 0.5,1), ncol=N)
x2 <- matrix(rbeta(N*Time, 5,1), ncol=N)
x1.vec <- c(x1)
x2.vec <- c(x2)
## generate outcome variable
y <- matrix(NA, ncol = N, nrow = Time)
for (i in 1:N) {
    y[, i] <- alphai[i] + treat[, i] + x1[,i] + x2[,i] + rnorm(Time)
}
y.vec <- c(y)

## generate unit and time index
unit.index <- rep(1:N, each = Time)
time.index <- rep(1:Time, N)

Data.str <- as.data.frame(cbind(y.vec, treat.vec, unit.index, x1.vec, x2.vec))
colnames(Data.str) <- c("y", "tr", "strata.id", "x1", "x2")

Data.obs <- as.data.frame(cbind(y.vec, treat.vec, unit.index, time.index, x1.vec, x2.vec))
colnames(Data.obs) <- c("y", "tr", "unit", "time", "x1", "x2")

############################################################
# Example 1: Stratified Randomized Experiments
############################################################

## run the weighted fixed effect regression with strata fixed effect.
## Note: the quantity of interest is Average Treatment Effect ("ate")
## and the standard errors allow heteroskedasticity and arbitrary
## autocorrelation.


### Average Treatment Effect
mod.ate <- wfe(y~ tr+x1+x2, data = Data.str, treat = "tr",
               unit.index = "strata.id", method = "unit",
               qoi = "ate", hetero.se=TRUE, auto.se=TRUE)
## summarize the results
summary(mod.ate)

### Average Treatment Effect for the Treated
mod.att <- wfe(y~ tr+x1+x2, data = Data.str, treat = "tr",
               unit.index = "strata.id", method = "unit",
               qoi = "att", hetero.se=TRUE, auto.se=TRUE)
## summarize the results
summary(mod.att)


############################################################
# Example 2: Observational Studies with Unit Fixed-effects
############################################################

## run the weighted fixed effect regression with unit fixed effect.
## Note: the quantity of interest is Average Treatment Effect ("ate")
## and the standard errors allow heteroskedasticity and arbitrary
## autocorrelation.

mod.obs <- wfe(y~ tr+x1+x2, data = Data.obs, treat = "tr",
               unit.index = "unit", time.index = "time", method = "unit",
               qoi = "ate", hetero.se=TRUE, auto.se=TRUE,
               White = TRUE, White.alpha = 0.05)

## summarize the results
summary(mod.obs)

## extracting weigths
summary(mod.obs)$W


## Not run: 
##D ###################################################################
##D # Example 3: Observational Studies with differences-in-differences
##D ###################################################################
##D 
##D ## run difference-in-differences estimator.
##D ## Note: the quantity of interest is Average Treatment Effect ("ate")
##D ## and the standard errors allow heteroskedasticity and arbitrary
##D ## autocorrelation.
##D 
##D mod.did <- wfe(y~ tr+x1+x2, data = Data.obs, treat = "tr",
##D                unit.index = "unit", time.index = "time", method = "unit",
##D                qoi = "ate", estimator ="did", hetero.se=TRUE, auto.se=TRUE,
##D                White = TRUE, White.alpha = 0.05, verbose = TRUE)
##D 
##D ## summarize the results
##D summary(mod.did)
##D 
##D ## extracting weigths
##D summary(mod.did)$W
##D 
##D #########################################################################
##D # Example 4: DID with Matching on Pre-treatment Outcomes
##D #########################################################################
##D 
##D ## implements matching on pre-treatment outcomes where the maximum
##D ## deviation is specified as 0.5 
##D 
##D mod.Mdid <- wfe(y~ tr+x1+x2, data = Data.obs, treat = "tr",
##D                unit.index = "unit", time.index = "time", method = "unit",
##D                qoi = "ate", estimator ="Mdid", hetero.se=TRUE, auto.se=TRUE,
##D                White = TRUE, White.alpha = 0.05, maxdev.did = 0.5, verbose = TRUE)
##D 
##D ## summarize the results
##D summary(mod.Mdid)
##D 
##D ## Note: setting the maximum deviation to infinity (or any value
##D ## bigger than the maximum pair-wise difference in the outcome) will
##D ## return the same result as Example 3.
##D 
##D dev <- 1000+max(Data.obs$y)-min(Data.obs$y)
##D mod.did2 <- wfe(y~ tr+x1+x2, data = Data.obs, treat = "tr",
##D                unit.index = "unit", time.index = "time", method = "unit",
##D                qoi = "ate", estimator ="Mdid", hetero.se=TRUE, auto.se=TRUE,
##D                White = TRUE, White.alpha = 0.05, maxdev.did = dev, verbose = TRUE)
##D 
##D ## summarize the results
##D summary(mod.did2)
##D mod.did2$coef[1] ==  mod.did$coef[1]
## End(Not run)




