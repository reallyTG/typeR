library(rpql)


### Name: build.start.fit
### Title: Constructs a start fit for use in the 'rpql' function
### Aliases: build.start.fit

### ** Examples


##################
## Example 1: Bernoulli GLMM with grouped covariates. 
## Independent cluster model with 50 clusters and equal cluster sizes of 10
## Nine covariates where the last covariate (soil type) is a factor with four levels
n <- 50; p <- 8; m <- 10
set.seed(123)
X <- data.frame(matrix(rnorm(n*m*p),n*m,p), soil=sample(1:4,size=m*n,replace=TRUE))
X$soil <- factor(X$soil)
X <- model.matrix(~ ., data = X)
colnames(X) <- paste("X",1:ncol(X),sep="")

Z <- X[,1:5] ## Random effects model matrix taken as first five columns
true_betas <- c(-0.1,1,-1,1,-1,1,-1,0,0,0,0,0) 
true_D <- matrix(0,ncol(Z),ncol(Z))
true_D[1:3,1:3] <- matrix(c(9,4.8,0.6,4.8,4,1,0.6,1,1),
	3,3,byrow=TRUE) ## 3 important random effects 

simy <- gendat.glmm(id = list(cluster = rep(1:n,each=m)), X = X, beta = true_betas, 
	Z = list(cluster = Z), D = list(cluster = true_D), family = binomial())

  
## Not run: 
##D library(lme4)
##D dat <- data.frame(y = simy$y, simy$X, simy$Z$cluster, simy$id)
##D fit_satlme4 <- glmer(y ~ X - 1 + (Z - 1 | cluster), data = dat, 
##D 	family = "binomial")
##D fit_sat <- build.start.fit(fit_satlme4, id = simy$id, gamma = 2, 
##D 	cov.groups = c(1:9,10,10,10)) 
##D 
##D new.fit <- rpql(y = simy$y, X = simy$X, Z = simy$Z, id = simy$id, lambda = 0.01, 
##D 	pen.type = "adl", pen.weights = fit_sat$pen.weights,
##D 	cov.groups = fit_sat$cov.groups, start = fit_sat, family = binomial())  
##D 	
## End(Not run)




