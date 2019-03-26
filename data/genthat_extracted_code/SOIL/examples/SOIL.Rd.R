library(SOIL)


### Name: SOIL
### Title: Sparsity Oriented Importance Learning (SOIL)
### Aliases: SOIL

### ** Examples

# REGRESSION CASE

# generate simulation data
n <- 50
p <- 8
beta <- c(3,1.5,0,0,2,0,0,0)
b0 <- 1
x <- matrix(rnorm(n*p,0,1),nrow=n,ncol=p)
e <- rnorm(n)
y <- x %*% beta + b0 + e


# compute SOIL using ARM with prior
v_ARM <- SOIL(x, y, family = "gaussian",
weight_type = "ARM", prior = TRUE)

# compute SOIL using BIC
v_BIC <- SOIL(x, y, family = "gaussian", weight_type = "BIC")

# compute SOIL using AIC
v_AIC <- SOIL(x, y, family = "gaussian", 
weight_type = "AIC", prior = TRUE)


# user supplied candidate models
candidate_models = rbind(c(0,0,0,0,0,0,0,1), 
c(0,1,0,0,0,0,0,1), c(0,1,1,1,0,0,0,1), 
c(0,1,1,0,0,0,0,1), c(1,1,0,1,1,0,0,0), 
c(1,1,0,0,1,0,0,0))

v1_BIC <- SOIL(x, y, 
psi=1, 
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


# compute SOIL for model_check using BIC with prior
b_BIC <- SOIL(x, y, family = "binomial", weight_type = "BIC")

candidate_models = 
rbind(c(0,0,0,0,0,0,0,1), 
c(0,1,0,0,0,0,0,1), 
c(1,1,1,1,0,0,0,0), 
c(0,1,1,0,0,0,0,1), 
c(1,1,0,1,1,0,0,0), 
c(1,1,0,0,1,0,0,0), 
c(0,0,0,0,0,0,0,0),
c(1,1,1,1,1,0,0,0))

# compute SOIL for model_check using AIC
# user supplied candidate models
b_AIC <- SOIL(x, y, family = "binomial",
method = "customize", candidate_models = candidate_models, 
weight_type = "AIC")



