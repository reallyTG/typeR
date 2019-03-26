## ------------------------------------------------------------------------
# Generate dataset
set.seed(200)
N <- 500  # number of subjects
p <- 5     # number of explanatory variables
mu.star <- 1:p  #rep(0,p)  # mean of the explanatory variables
sd <- 1:p # rep(1,p) # standard deviations
C <- matrix(c(   # correlation matrix
1,   0.8, 0,   0,   0,
0.8, 1,   0,   0,   0,
0,   0,   1,   0.3, 0.6,
0,   0,   0.3, 1,   0.7,
0,   0,   0.6, 0.7, 1), nrow=p)
Sigma.star <- diag(sd)%*%C%*%diag(sd) # covariance matrix
beta.star <- c(1, -1, 1, 0, -1) # coefficients
beta0.star <- 0  # intercept
beta.true = c(beta0.star,beta.star)

# Design matrix
X.complete <- matrix(rnorm(N*p), nrow=N)%*%chol(Sigma.star)+
              matrix(rep(mu.star,N), nrow=N, byrow = TRUE)

# Reponse vector
p1 <- 1/(1+exp(-X.complete%*%beta.star-beta0.star))
y <- as.numeric(runif(N)<p1)

## ------------------------------------------------------------------------
# Generate missingness
set.seed(200)
p.miss <- 0.10
patterns <- runif(N*p)<p.miss # missing completely at random
X.obs <- X.complete
X.obs[patterns] <- NA

## ------------------------------------------------------------------------
head(X.obs)

## ------------------------------------------------------------------------
#Charge library
library(misaem)

# SAEM
list.saem = miss.saem(X.obs,y)
print(list.saem$beta)

## ------------------------------------------------------------------------
# SAEM with variance estimation
list.saem = miss.saem(X.obs,y,var_cal = TRUE)
print(list.saem$beta)
print(list.saem$var_obs)

## ------------------------------------------------------------------------
# model selection for SAEM
list.saem.select = model_selection(X.obs,y)
print(list.saem.select$subset_choose)
print(list.saem.select$beta)

## ------------------------------------------------------------------------
# Generate test set with missingness
set.seed(200)
Nt = 100
X.test <- matrix(rnorm(Nt*p), nrow=Nt)%*%chol(Sigma.star)+
          matrix(rep(mu.star,Nt), nrow=Nt, byrow = TRUE)

# Real value for response of test set
p1 <- 1/(1+exp(-X.test%*%beta.star-beta0.star))
y.test <- as.numeric(runif(Nt)<p1)

# Generate missingness on test set
p.miss <- 0.10
X.test[runif(Nt*p)<p.miss] <- NA

# Prediction on test set
pr.saem <- pred_saem(X.test, list.saem.select$beta, 
                     list.saem.select$mu, list.saem.select$sig2)

# Confusion matrix
pred.saem = (pr.saem>0.5)*1
table(y.test,pred.saem )

