library(rpql)


### Name: rpql
### Title: Joint effects selection in GLMMs using regularized PQL.
### Aliases: rpql rpql.default print.rpql

### ** Examples

## Please note all examples below use the \code{rpqlseq} wrapper function. 

library(lme4)
library(gamlss.dist)

##################
## Example 1: Poisson GLMM on simulated data 
## Indepenent cluster model with 30 clusters and equal cluster sizes of 10
## 9 fixed and random effect covariates including a fixed and random intercept
library(mvtnorm)
set.seed(1)
n <- 30; m <- 10; p <- 8; 
## Generate rows of a model matrix from a multivariate normal distribution 
## with AR1 covariance structure. 

H <- abs(outer(1:p, 1:p, "-")) 
X <- cbind(1,rmvnorm(n*m,rep(0,p),sigma=0.5^H)); 
Z <- X 
true_betas <- c(0.1,1,-1,-1,1,rep(0,p-4)) ## 5 truly important fixed effects
true_D <- matrix(0,ncol(Z),ncol(Z))
true_D[1:3,1:3] <- matrix(c(1,0.6,0.6,0.6,1,0.4,0.6,0.4,1),3,3,byrow=TRUE) 
## 3 important random effects

simy <- gendat.glmm(id = list(cluster=rep(1:n,each=m)), X = X, beta = true_betas, 
	Z = list(cluster=Z), D = list(cluster=true_D), family = poisson()) 

	
## Not run: 
##D ## Construct a solution path using adaptive LASSO for selection 
##D dat <- data.frame(y = simy$y, simy$X, simy$Z$cluster, simy$id)
##D fit_satlme4 <- glmer(y ~ X - 1 + (Z - 1 | cluster), data = dat,
##D 	family = "poisson")
##D fit_sat <- build.start.fit(fit_satlme4, gamma = 2)
##D ## Please see example 3 for another way of constructing the adaptive weights
##D 
##D lambda_seq <- lseq(1e-6,1,length=100)
##D fit <- rpqlseq(y = simy$y, X = simy$X, Z = simy$Z, id = simy$id, 
##D 	family = poisson(), lambda = lambda_seq, pen.type = "adl", 
##D 	pen.weights = fit_sat$pen.weights, start = fit_sat)
##D 
##D summary(fit$best.fit[[3]])  
##D # apply(fit$collect.ics, 2, which.min) ## Look at best fit chosen by different ICs
##D 
##D ## Note, if you wanted to penalized the fixed effects only, this can achieved
##D ## by setting fit_sat$pen.weights$random$cluster <- rep(0,ncol(simy$Z$cluster))
##D 
##D ## An alternative way to construct the X and Z matrices for input into rpqlseq is as follows:
##D XMM <- unname(model.matrix(fit_satlme4)) 
##D ZMM <- getME(fit_satlme4,"mmList"); names(ZMM) <- "cluster"
##D lambda_seq <- lseq(1e-6,1,length=100)
##D fit <- rpqlseq(y = simy$y, X = XMM, Z = ZMM, id = simy$id, 
##D  	family = poisson(), lambda = lambda_seq, pen.type = "adl", 
##D 	pen.weights = fit_sat$pen.weights, start = fit_sat)
##D ## Big thanks for Andrew Olney for this suggestion!
## End(Not run)


##################
## Example 2: Similar to example 1 but with Bernoulli GLMMs 
## 30 clusters, cluster size of 20
library(mvtnorm)
set.seed(1)
n <- 30; m <- 20; p <- 8; 
## Generate rows of a model matrix from a multivariate normal distribution 
## with AR1 covariance structure. 

H <- abs(outer(1:p, 1:p, "-")) 
X <- cbind(1,rmvnorm(n*m,rep(0,p),sigma=0.5^H)); 
Z <- X 
true_betas <- c(-0.1,1,-1,1,-1,rep(0,p-4)) ## 5 truly important fixed effects
true_D <- matrix(0,ncol(Z),ncol(Z))
true_D[1:3,1:3] <- diag(c(3,2,1), nrow = 3)
## 3 important random effects

simy <- gendat.glmm(id = list(cluster=rep(1:n,each=m)), X = X, 
  beta = true_betas, Z = list(cluster=Z), D = list(cluster=true_D), family = binomial()) 

	
## Not run: 
##D ## Construct a solution path using adaptive LASSO for selection 
##D dat <- data.frame(y = simy$y, simy$X, simy$Z$cluster, simy$id)
##D fit_satlme4 <- glmer(y ~ X - 1 + (Z - 1 | cluster), data = dat, 
##D 	family = "binomial")
##D fit_sat <- build.start.fit(fit_satlme4, gamma = 2)
##D 
##D lambda_seq <- lseq(1e-6,1,length=100)
##D best.fit <- list(ics = rep(Inf,6))
##D fit <- rpqlseq(y = simy$y, X = simy$X, Z = simy$Z, id = simy$id, 
##D 	family = binomial(), lambda = lambda_seq, pen.type = "adl", 
##D 	pen.weights = fit_sat$pen.weights, start = fit_sat)
##D 	
##D summary(fit$best.fit[[3]])  
##D # apply(fit$collect.ics, 2, which.min) ## Look at best fit chosen by different ICs
##D 
##D ## An alternative way to construct the X and Z matrices for input into rpqlseq is as follows:
##D XMM <- unname(model.matrix(fit_satlme4)) 
##D ZMM <- getME(fit_satlme4,"mmList"); names(ZMM) <- "cluster"
##D lambda_seq <- lseq(1e-6,1,length=100)
##D fit <- rpqlseq(y = simy$y, X = XMM, Z = ZMM, id = simy$id, 
##D  	family = binomial(), lambda = lambda_seq, pen.type = "adl", 
##D 	pen.weights = fit_sat$pen.weights, start = fit_sat)
## End(Not run)


##################
## Example 3: Bernoulli GLMMs on simulated data
## Nested data with 200 observations in total: split into 10 creeks, 
## 5 samples nested within each creek
## Please see example in gendat.glmm for further details
mn <- 200; 
X <- matrix(1,mn,1); 
ids <- list(samples = rep(1:50,each=4), creek = rep(1:10,each=20)) 
## We have two sets of random intercepts only, one for creek and one for 
## samples nested within creek.
Zs <- list(samples = X, creek = X) 

true_betas <- -0.1 
true_D <- list(samples = as.matrix(0.001), creek = as.matrix(1)) 
## Please ensure each element of true_D is a matrix

simy <- gendat.glmm(id = ids, X = X, beta = true_betas, Z = Zs, 
	D = true_D, trial.size = 1, family = binomial())

## Not run: 
##D ## Construct a solution path use adaptive LASSO for selection
##D ## Here is another way of constructing the adaptive weights:
##D ## Use the fact that rpql can do a final fit based on maximum likelihood
##D ## to obtain a good saturated fit.
##D fit_sat <- rpql(y = simy$y, X = simy$X, Z = simy$Z, id = simy$id, 
##D 	family = binomial(), lambda = 0, hybrid = TRUE)
##D fit_sat <- build.start.fit(fit_sat$hybrid, gamma = 2)
##D 	
##D fit <- rpqlseq(y = simy$y, X = simy$X, Z = simy$Z, id = simy$id, 
##D 	family = binomial(), lambda = lambda_seq, pen.type = "adl", 
##D 	pen.weights = fit_sat$pen.weights, start = fit_sat)
##D 
##D summary(fit$best.fit[[3]])  
##D # apply(fit$collect.ics, 2, which.min) ## Look at best fit chosen by different ICs
## End(Not run)
   

##################
## Example 4: Linear mixed models on Alfalfa split-plot data

## Not run: 
##D 
##D library(nlme)
##D data(Alfalfa)
##D Alfalfa$Yield <- scale(Alfalfa$Yield)
##D X <- as.matrix(model.matrix(~ Date, data = Alfalfa)) 
##D ## Note Date is categorical variable!
##D colnames(X)[1] <- "x1"
##D Z <- list(BlockVariety = matrix(1,nrow(X),1), Block = matrix(1,nrow(X),1))
##D ## Four samples of each Block*Variety
##D ids <- list(BlockVariety = rep(1:(nrow(X)/4),each=4), 
##D 	Block = as.numeric(Alfalfa$Block)) 
##D 
##D ## How you would fit it in lme4
##D fit_satlme4 <- lmer(Yield ~ X - 1 + (1|Block/Variety), data = Alfalfa)
##D fit_sat <- build.start.fit(fit_satlme4, cov.groups = c(1,2,2,2), gamma = 2)
##D 
##D ## Construct a solution path using adaptive LASSO for selection
##D lambda_seq <- lseq(1e-5,2,length=100)
##D fit <- rpqlseq(y = Alfalfa$Yield, X = X, Z = Z, id = ids, 
##D 	lambda = lambda_seq, cov.groups = c(1,2,2,2), pen.type = "adl", 
##D 	pen.weights = fit_sat$pen.weights, start = fit_sat)
##D 
##D summary(fit$best.fit[[3]])  
##D # apply(fit$collect.ics, 2, which.min) ## Look at best fit chosen by different ICs
##D 
##D 
##D ## An alternative way to construct the X and Z matrices for input into rpqlseq is as follows:
##D X <- unname(model.matrix(fit_satlme4)) 
##D Z <- getME(fit_satlme4, "mmList"); names(Z) <- c("BlockVariety", "Block")
##D lambda_seq <- lseq(1e-6,1,length=100)
##D fit <- rpqlseq(y = Alfalfa$Yield, X = X, Z = Z, id = ids, 
##D 	lambda = lambda_seq, cov.groups = c(1,2,2,2), pen.type = "adl", 
##D 	pen.weights = fit_sat$pen.weights, start = fit_sat)
## End(Not run)


##################
## Example 5: Linear mixed models on sleep study dataset

## Not run: 
##D data(sleepstudy)
##D 
##D ## How you fit it in lme4
##D ## Response is scaled so as to avoid large variances and easier intepretation
##D sleepstudy$Reaction <- scale(sleepstudy$Reaction) 
##D sleepstudy$Days <- scale(sleepstudy$Days)
##D fm1 <- lmer(Reaction ~ Days + (Days|Subject), sleepstudy)
##D 
##D ## How you fit it using rpql
##D ## Construct a solution path using adaptive LASSO for selection 
##D X <- cbind(1,sleepstudy$Days)
##D Z <- list(subject = X)
##D ids <- list(subject = as.numeric(sleepstudy$Subject))
##D fit_sat <- build.start.fit(fm1, gamma = 2)
##D 
##D lambda_seq <- lseq(1e-4,1,length=100)
##D fit <- rpqlseq(y = sleepstudy$Reaction, X = X, Z = Z, id = ids, 
##D 	lambda = lambda_seq, pen.type = "adl", 
##D 	pen.weights = fit_sat$pen.weights, start = fit_sat)
##D 
##D summary(fit$best.fit[[3]])  
##D # apply(fit$collect.ics, 2, which.min) ## Look at best fit chosen by different ICs
##D ## Best fit might well be the saturated fit! 
##D ## This is at least consistent with confint(fm1)
##D 
##D ## An alternative way to construct the X and Z matrices for input into rpqlseq is as follows:
##D X <- unname(model.matrix(fm1)) 
##D Z <- getME(fm1, "mmList"); names(Z) <- "subject"
##D lambda_seq <- lseq(1e-6,1,length=100)
##D fit <- rpqlseq(y = sleepstudy$Reaction, X = X, Z = Z, id = ids, 
##D 	lambda = lambda_seq, pen.type = "adl", 
##D 	pen.weights = fit_sat$pen.weights, start = fit_sat)
## End(Not run)


##################
## Example 6: GLMM with lognormal responses
## Fixed effects selection only

## Not run: 
##D n <- 50; m <- 10; p <- 8; 
##D H <- abs(outer(1:p, 1:p, "-")) 
##D X <- cbind(1,rmvnorm(n*m,rep(0,p),sigma=0.5^H)); 
##D Z <- X[,1:3] ## 3 random effects all of which important
##D true_betas <- c(0.1,1,-1,-1,1,rep(0,p-4)) ## 5 important fixed effects
##D true_D <- matrix(0,ncol(Z),ncol(Z))
##D true_D[1:3,1:3] <- matrix(c(1,0.6,0.6,0.6,1,0.4,0.6,0.4,1),3,3,byrow=TRUE) 
##D 
##D simy <- gendat.glmm(id = list(cluster=rep(1:n,each=m)), X = X, 
##D 	beta = true_betas, Z = list(cluster=Z), D = list(cluster=true_D), 
##D 	family = LOGNO(), phi = 1) 
##D 
##D ## We will use the lasso penalty for fixed effects only with no weights
##D ## Note lognormal mixed models are usually hard to fit by maximum likelihood in R!
##D ## Hence adaptive weights are sightly hard to obtain
##D 
##D ## Note also that since random effects are not penalized, then generally 
##D ## the corresponding fixed effect covariates should not be penalized 
##D ## (at least in longitudinal studies), in keeping in line with the 
##D ## hierarchical principle of the effects.
##D ## To account for this in the above, we can use the pen.weights argument 
##D ## to prevent penalization of the first three fixed effect covariates
##D 
##D fit <- rpqlseq(y = simy$y, X = simy$X, Z = simy$Z, id = simy$id, 
##D   family = LOGNO(), lambda = lambda_seq, pen.type = "lasso", start = NULL, 
##D 	pen.weights = list(fixed = rep(c(0,1), c(3,ncol(X)-3))))
##D 
##D summary(fit$best.fit[[3]])  
##D # apply(fit$collect.ics, 2, which.min) ## Look at best fit chosen by different ICs
## End(Not run)




