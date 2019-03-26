library(rpql)


### Name: gendat.glmm
### Title: Simulates datasets based on a Generalized Linear Mixed Model
###   (GLMM).
### Aliases: gendat.glmm

### ** Examples


##################
## Example 1: Linear Mixed Models 
## Independent cluster model with 50 clusters
## Nine covariates including a fixed and random intercept
library(mvtnorm)
library(lme4)

n <- 50; m <- 10; p <- 8; 
## Generate rows of a model matrix from a multivariate normal distribution with 
## AR1 covariance structure. 

H <- abs(outer(1:p, 1:p, "-")) 
X <- cbind(1,rmvnorm(n*m,rep(0,p),sigma=0.5^H)); 

Z <- X 
true_betas <- c(1,3,2,1.5,-1,0,0,0,0) ## 5 important fixed effects 
true_D <- matrix(0,p+1,p+1) ## 3 important random effects
true_D[1:3,1:3] <- matrix(c(9,4.8,0.6,4.8,4,1,0.6,1,1),3,3,byrow=TRUE)

simy <- gendat.glmm(id = list(cluster = rep(1:n,each=m)), X = X, beta = true_betas, 
	Z = list(cluster = Z), D = list(cluster = true_D), phi = 1, family = gaussian()) 
## Notice how id, Z, and D all are lists with one element, and that 
## the name of the first element (a generic name "cluster") is the 
## same for all three lists. 
## id is where the action takes place. In particular, id$cluster is 
## designed so that the first 12 elements correspond to cluster 1, 
## the second 12 elements correspond to cluster 2, and so forth. 
## In turn, the first 12 rows of X and Z$cluster correspond 
## to cluster 1, and so on. 

## Not run: 
##D dat <- data.frame(y = simy$y, simy$X, simy$Z$cluster, simy$id)
##D fit_satlme4 <- lmer(y ~ X - 1 + (Z - 1 | cluster), data = dat,
##D 	REML = FALSE)
##D fit_sat <- build.start.fit(fit_satlme4, gamma = 2)
##D 
##D 
##D lambda_seq <- lseq(1e-4,1,length=100)
##D fit <- rpqlseq(y = simy$y, X = simy$X, Z = simy$Z, id = simy$id, 
##D 	family = gaussian(), lambda = lambda_seq, pen.type = "adl", 
##D 	pen.weights = fit_sat$pen.weights, start = fit_sat)
##D 
##D summary(fit$best.fit[[3]])  
##D # apply(fit$collect.ics, 2, which.min) ## Look at best fit chosen by different ICs
## End(Not run)


##################
## Example 2: Bernoulli GLMMs on simulated data
## Nested data with 200 observations in total: split into 10 creeks, 
## 5 samples nested within each creek

mn <- 200; 
X <- as.matrix(rep(1,mn)); 
ids <- list(samples = rep(1:50,each=4), creek = rep(1:10,each=20)) 
## We have two sets of random intercepts only, one for creek and one 
## 	for samples nested within creek.
Zs <- list(samples = X, creek = X) 

true_betas <- -0.1 
## Please ensure each element of true_D is a matrix
true_D <- list(samples = as.matrix(0.001), creek = as.matrix(1)) 

simy <- gendat.glmm(id = ids, X = X, beta = true_betas, Z = Zs, D = true_D, 
	trial.size = 1, family = binomial())

## Not run: 
##D 
##D ## Construct a solution path use adaptive LASSO for selection
##D ## Here is another way of constructing the adaptive weights:
##D ## Use the fact that rpql can do a final fit based on maximum likelihood
##D ## to obtain a good saturated fit.
##D fit_sat <- rpql(y = simy$y, X = simy$X, Z = simy$Z, id = simy$id, 
##D 	family = binomial(), lambda = 0, hybrid = TRUE)
##D fit_sat <- build.start.fit(fit_sat$hybrid, gamma = 2)
##D 	
##D lambda_seq <- lseq(1e-6,1,length=100)
##D fit <- rpqlseq(y = simy$y, X = simy$X, Z = simy$Z, id = simy$id, 
##D 	family = binomial(), lambda = lambda_seq, pen.type = "adl", 
##D 	pen.weights = fit_sat$pen.weights, start = fit_sat)
##D 
##D summary(fit$best.fit[[3]])  
##D # apply(fit$collect.ics, 2, which.min) ## Look at best fit chosen by different ICs
## End(Not run)



