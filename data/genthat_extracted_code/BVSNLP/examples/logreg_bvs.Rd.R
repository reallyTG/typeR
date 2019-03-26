library(BVSNLP)


### Name: logreg_bvs
### Title: Non-parallel version of Bayesian variable selector for logistic
###   regression data using nonlocal priors
### Aliases: logreg_bvs

### ** Examples

### Initializing parameters
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
colnames(X) <- paste("gene_",c(1:p),sep="")
beta <- numeric(p)
beta[c(1:length(Beta))] <- Beta
XB <- X%*%beta
probs <- as.vector(exp(XB)/(1+exp(XB)))
y <- rbinom(n,1,probs)
exmat <- cbind(y,X)
tau <- 0.5; r <- 1; a <- 3; b <- p-a; in_cons <- a;
loopcnt <- 100; cplng <- FALSE;
initProb <- in_cons/p

### Initializing Chains
schain <- p
while (schain > in_cons || schain == 0) {
chain1 <- rbinom(p, 1, initProb)
 schain <- sum(chain1)
}
chain1 <- as.numeric(c(1, chain1))
chain2 <- chain1
nlptype <- 0 ## PiMOM nonlocal prior
nf <- 0 ### No fixed columns

### Running the function
bvsout <- logreg_bvs(exmat,chain1,nf,tau,r,nlptype,a,b,in_cons,loopcnt,cplng,chain2)

### Number of visited models for this specific run:
bvsout$num_vis_models

### The selected model:
which(bvsout$max_chain > 0)

### Estimated coefficients:
bvsout$beta_hat

### The unnormalized probability of the selected model:
bvsout$max_prob



