library(BVSNLP)


### Name: bvs
### Title: High dimensional Bayesian variable selection using nonlocal
###   priors
### Aliases: bvs

### ** Examples

### Simulating Logistic Regression Data
n <- 200
p <- 40
set.seed(123)
Sigma <- diag(p)
full <- matrix(c(rep(0.5, p*p)), ncol=p)
Sigma <- full + 0.5*Sigma
cholS <- chol(Sigma)
Beta <- c(-1.9,1.3,2.2)
X <- matrix(rnorm(n*p), ncol=p)
X <- X%*%cholS
beta <- numeric(p)
beta[c(1:length(Beta))] <- Beta
XB <- X%*%beta
probs <- as.vector(exp(XB)/(1+exp(XB)))
y <- rbinom(n,1,probs)
colnames(X) <- paste("gene_",c(1:p),sep="")

### Running 'bvs' function without coupling and with hyperparamter selection
### procedure
bout <- bvs(X, y, family = "logistic", nlptype = "piMOM",
            mod_prior = "beta", niter = 50)
            
### Highest Posterior Model
bout$HPM

### Estimated Coefficients:
bout$beta_hat

### Number of Visited Models:
bout$num_vis_models



