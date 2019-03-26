library(BVSNLP)


### Name: CoefEst
### Title: Coefficient estimation for a specific set of covariates
### Aliases: CoefEst

### ** Examples

### Simulating Survival Data
n <- 400
p <- 1000
lambda <- 0.8
cens_rate <- 0.27
set.seed(123)
Sigma <- diag(p)
full <- matrix(c(rep(0.5, p*p)), ncol=p)
Sigma <- full + 0.5*Sigma
cholS <- chol(Sigma)
Beta <- c(-1.8, 1.2, -1.7, 1.4, -1.4, 1.3)
X = matrix(rnorm(n*p), ncol=p)
X = X%*%cholS
X <- scale(X)
beta <- numeric(p)
beta[c(1:length(Beta))] <- Beta
XB <- X%*%beta
uvector <- -log(runif(n));
times <- uvector/(lambda*exp(XB))
cens_time <- quantile(times,1-cens_rate)
status <- as.numeric(times < cens_time)
TS <- cbind(times,status)

### Estimating coeffcients of the true model and an arbitrary hyper
### parameter for the iMOM prior density
mod <- c(1:6)
coef <- CoefEst(X, TS, mod, tau = 1.8, r = 2, family = "survival")
coef




