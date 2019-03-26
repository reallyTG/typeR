library(BVSNLP)


### Name: HyperSelect
### Title: Hyperparameter selection for iMOM prior density
### Aliases: HyperSelect

### ** Examples

### Simulating Logistic Regression Data
n <- 20
p <- 100
set.seed(321)
Sigma <- diag(p)
full <- matrix(c(rep(0.5, p * p)), ncol = p)
Sigma <- full + 0.5 * Sigma
cholS <- chol(Sigma)
Beta <- c(1, 1.8, 2.5)
X = matrix(rnorm(n*p, 1, 2), ncol = p)
X = X%*%cholS
beta <- numeric(p)
beta[c(1:length(Beta))] <- Beta
XB <- X%*%beta
probs <- as.vector(exp(XB)/(1+exp(XB)))
y <- rbinom(n,1,probs)
colnames(X) <- paste("gene_",c(1:p),sep="")
Xout <- PreProcess(X)
XX <- Xout$X
hparam <- HyperSelect(XX, y, iter = 1000, mod_prior = "beta",
                      family = "logistic")

hparam$tau



