library(BVSNLP)


### Name: ModProb
### Title: Logarithm of unnormalized probability of a given model
### Aliases: ModProb

### ** Examples

### Simulating Logistic Regression Data
n <- 400
p <- 1000
set.seed(123)
Sigma <- diag(p)
full <- matrix(c(rep(0.5, p*p)), ncol=p)
Sigma <- full + 0.5*Sigma
cholS <- chol(Sigma)
Beta <- c(1,1.8,2.5)
X = matrix(rnorm(n*p), ncol=p)
X = X%*%cholS
beta <- numeric(p)
beta[c(1:length(Beta))] <- Beta
XB <- X%*%beta
probs <- as.vector(exp(XB)/(1+exp(XB)))
y <- rbinom(n,1,probs)

### Calling the function for a subset of the true model, with an arbitrary
### parameters for prior densities
mod <- c(1:3)
Mprob <- ModProb(X, y, mod, tau = 0.7, r = 1, a = 7, b = 993,
                 family = "logistic")

Mprob



