library(BVSNLP)


### Name: cox_bvs
### Title: Non-parallel version of Bayesian variable selector for survival
###   data using nonlocal priors
### Aliases: cox_bvs

### ** Examples

### Initializing the parameters
n <- 100
p <- 40
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
sur_times <- rexp(n,exp(XB))
cens_times <- rexp(n,0.2)
times <- pmin(sur_times,cens_times)
status <- as.numeric(sur_times <= cens_times)
exmat <- cbind(times,status,X)
L <- 10; J <- 10
d <- 2 * ceiling(log(p))
temps <- seq(3, 1, length.out = L)
tau <- 0.5; r <- 1; a <- 6; b <- p-a
nlptype <- 0 ### PiMOM nonlocal prior
cur_cols <- c(1,2,3) ### Starting model for the search algorithm
nf <- 0 ### No fixed columns

### Running the Function
coxout <- cox_bvs(exmat,cur_cols,nf,tau,r,nlptype,a,b,d,L,J,temps)

### The number of visited model for this specific run:
length(coxout$hash_key)


### The selected model:
which(coxout$max_model>0)

### The unnormalized probability of the selected model:
coxout$max_prob




