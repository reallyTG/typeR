library(glmvsd)


### Name: glmvsd
### Title: Variable Selection Deviation (VSD)
### Aliases: glmvsd

### ** Examples

# REGRESSION CASE

# generate simulation data
n <- 50
p <- 8
beta <- c(3,1.5,0,0,2,0,0,0)
sigma <- matrix(0,p,p)
for(i in 1:p){
   for(j in 1:p) sigma[i,j] <- 0.5^abs(i-j)
}
x <- mvrnorm(n, rep(0,p), sigma)
e <- rnorm(n)
y <- x %*% beta + e

# user provide a model to be checked
model_check <- c(0,1,1,1,0,0,0,1)

# compute VSD for model_check using ARM with prior
v_ARM <- glmvsd(x, y, n_train = ceiling(n/2), 
no_rep=50, model_check = model_check, psi=1, 
family = "gaussian", method = "union", 
weight_type = "ARM", prior = TRUE)

# compute VSD for model_check using AIC
v_AIC <- glmvsd(x, y, 
model_check = model_check,
family = "gaussian", method = "union", 
weight_type = "AIC", prior = TRUE)

# compute VSD for model_check using BIC
v_BIC <- glmvsd(x, y, 
model_check = model_check,
family = "gaussian", method = "union", 
weight_type = "BIC", prior = TRUE)

# user supplied candidate models
candidate_models = rbind(c(0,0,0,0,0,0,0,1), 
c(0,1,0,0,0,0,0,1), c(0,1,1,1,0,0,0,1), 
c(0,1,1,0,0,0,0,1), c(1,1,0,1,1,0,0,0), 
c(1,1,0,0,1,0,0,0))

v1_BIC <- glmvsd(x, y, 
model_check = model_check, psi=1, 
family = "gaussian",
method = "customize", 
candidate_models = candidate_models, 
weight_type = "BIC", prior = TRUE)

# CLASSIFICATION CASE

# generate simulation data
n = 300 
p = 8
b <- c(1,1,1,-3*sqrt(2)/2) 
x=matrix(rnorm(n*p, mean=0, sd=1), n, p) 
feta=x[, 1:4]%*%b 
fprob=exp(feta)/(1+exp(feta))
y=rbinom(n, 1, fprob)

# user provide a model to be checked
model_check <- c(0,1,1,1,0,0,0,1)

# compute VSD for model_check using BIC with prior
b_BIC <- glmvsd(x, y, n_train = ceiling(n/2),
family = "binomial",
no_rep=50, model_check = model_check, psi=1, 
method = "union", weight_type = "BIC", 
prior = TRUE)

candidate_models = 
rbind(c(0,0,0,0,0,0,0,1), 
c(0,1,0,0,0,0,0,1), 
c(1,1,1,1,0,0,0,0), 
c(0,1,1,0,0,0,0,1), 
c(1,1,0,1,1,0,0,0), 
c(1,1,0,0,1,0,0,0), 
c(0,0,0,0,0,0,0,0),
c(1,1,1,1,1,0,0,0))

# compute VSD for model_check using AIC
# user supplied candidate models
b_AIC <- glmvsd(x, y, 
family = "binomial",
model_check = model_check, psi=1, 
method = "customize", 
candidate_models = candidate_models, 
weight_type = "AIC")



