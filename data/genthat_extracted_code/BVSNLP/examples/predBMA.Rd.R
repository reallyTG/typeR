library(BVSNLP)


### Name: predBMA
### Title: Predictive accuracy measurement using Bayesian Model Averaging
### Aliases: predBMA

### ** Examples

### Simulating Logistic Regression Data
n <- 200
p <- 40
set.seed(123)
Sigma <- diag(p)
full <- matrix(c(rep(0.5, p*p)), ncol=p)
Sigma <- full + 0.5*Sigma
cholS <- chol(Sigma)
Beta <- c(-1.7,1.8,2.5)
X <- matrix(rnorm(n*p), ncol=p)
X <- X%*%cholS
colnames(X) <- c(paste("gene_",c(1:p),sep=""))
beta <- numeric(p)
beta[c(1:length(Beta))] <- Beta
Xout <- PreProcess(X)
X <- Xout$X
XB <- X%*%beta
probs <- as.vector(exp(XB)/(1+exp(XB)))
y <- rbinom(n,1,probs)
train_idx <- sample(1:n,0.8*n)
test_idx <- setdiff(1:n,train_idx)
X_train <- X[train_idx,]
y_train <- y[train_idx]
bout <- bvs(X_train, y_train, prep=FALSE, family = "logistic",
           mod_prior = "beta",niter = 50)
BMAout <- predBMA(bout, X, y, train_idx = train_idx, test_idx = test_idx,
                 family="logistic")
### AUC for the prediction:
BMAout$auc

### Plotting ROC Curve
roc <- BMAout$roc_curve
plot(roc,lwd=2,type='l',col='blue')



