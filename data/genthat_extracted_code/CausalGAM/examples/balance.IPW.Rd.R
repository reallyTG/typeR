library(CausalGAM)


### Name: balance.IPW
### Title: Check Post-Weighting Balance for (A)IPW Estimators Using
###   Generalized Additive Models
### Aliases: balance.IPW
### Keywords: models

### ** Examples

## Not run: 
##D set.seed(1234)
##D ## number of units in sample
##D n <- 2000
##D 
##D 
##D ## measured potential confounders
##D z1 <- rnorm(n)
##D z2 <- rnorm(n)
##D z3 <- rnorm(n)
##D z4 <- rnorm(n)
##D 
##D ## treatment assignment
##D prob.treated <-	pnorm(-0.5 + 0.75*z2)
##D x <- rbinom(n, 1, prob.treated)
##D 
##D ## potential outcomes
##D y0 <- z4 + rnorm(n)
##D y1 <- z1 + z2 + z3 + cos(z3*2) + rnorm(n)
##D 
##D ## observed outcomes
##D y <- y0
##D y[x==1] <- y1[x==1] 	     	
##D 
##D 
##D ## put everything in a data frame
##D examp.data <- data.frame(z1, z2, z3, z4, x, y)
##D 
##D ## augment data with interactions and powers of covariates
##D examp.data$z1z1 <- examp.data$z1^2
##D examp.data$z2z2 <- examp.data$z2^2
##D examp.data$z3z3 <- examp.data$z3^2
##D examp.data$z4z4 <- examp.data$z4^2
##D 
##D examp.data$z1z2 <- examp.data$z1 * examp.data$z2
##D examp.data$z1z3 <- examp.data$z1 * examp.data$z3
##D examp.data$z1z4 <- examp.data$z1 * examp.data$z4
##D 
##D examp.data$z2z3 <- examp.data$z2 * examp.data$z3
##D examp.data$z2z4 <- examp.data$z2 * examp.data$z4
##D 
##D examp.data$z3z4 <- examp.data$z3 * examp.data$z4
##D 
##D 
##D 
##D ## check balance of a propensity score model that is not sufficient to
##D ## control confounding bias
##D 
##D bal.1 <- balance.IPW(pscore.formula=x~s(z3)+s(z4),
##D                      pscore.family=binomial(probit),
##D                      treatment.var="x",
##D                      outcome.var="y",
##D                      data=examp.data,
##D                      nboot=250)
##D 
##D print(bal.1) ## some big z-statistics here indicating balance not so great
##D 
##D 
##D ## try again
##D bal.2 <- balance.IPW(pscore.formula=x~z1+z2+z3+z4,
##D                      pscore.family=binomial(probit),
##D                      treatment.var="x",
##D                      outcome.var="y",
##D                      data=examp.data,
##D                      nboot=250)
##D 
##D print(bal.2) ## balance looks much better-- 
##D              ##    only 1 out of 14 zs > 2.0 in absval
##D 
## End(Not run)



