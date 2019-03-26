library(GENMETA)


### Name: GENMETA.plot
### Title: Generalized Meta-analysis(forest plot)
### Aliases: GENMETA.plot

### ** Examples

# This example shows how to obtain the forest plot of GENMETA object.
#########################
### Basic setting #######
#########################
d.X = 3 # number of covariates.
mu = matrix(rep(0,d.X), nrow=d.X) # mean vector of the covariates.
r1 = 0.3 # correlation coefficient of the covariates.
r2 = 0.6
r3 = 0.1
Sigma = matrix(
  c(1, r1, r2,
    r1, 1, r3,
    r2, r3, 1),
  nrow=d.X,
  ncol=d.X) # covariance matrix of the covariates.
beta.star = matrix(c(-1.2, log(1.3), log(1.3), log(1.3)),nrow = d.X+1) 
#beta.star = matrix(c(-1.2, 0.26, 0.26, 0.26),nrow = d.X+1) # beta.star
#beta.star = matrix(c(-3, 1, 2, 3),nrow = d.X+1) # beta.star
n1 = 300 # sample size of the 1st data set.
n2 = 500 # 2nd
n3 = 1000 # 3rd
n = 50
sim=1
set.seed(sim)
X.rf = MASS::mvrnorm(n = n, mu, Sigma)
X.m1 = MASS::mvrnorm(n = n1, mu, Sigma) # Generate the covariates.
X.m1.1 = cbind(rep(1, n1), X.m1) # Add a column of 1's to X.m1.
p.m1 = 1/(1+exp(-X.m1.1%*%beta.star)) # the vector of probabilities
Y.m1 = rbinom(n1, size=1, p.m1) # the Bernoulli responses
# print(p.m1[1])
# print(mean(Y.m1))
# print(mean(p.m1))
# Generate data set 2. m1 means model 2.
X.m2 = MASS::mvrnorm(n = n2, mu, Sigma)
X.m2.1 = cbind(rep(1, n2), X.m2)
p.m2 = 1/(1+exp(-X.m2.1%*%beta.star))
Y.m2 = rbinom(n2, size=1, p.m2)
X.m3 = MASS::mvrnorm(n = n3, mu, Sigma)
X.m3.1 = cbind(rep(1, n3), X.m3)
p.m3 = 1/(1+exp(-X.m3.1%*%beta.star))
Y.m3 = rbinom(n3, size=1, p.m3)
#####
### Create data sets in the format of data frame.
#####
data.m1 = data.frame(Y=Y.m1, X.m1)
data.m2 = data.frame(Y=Y.m2, X.m2)
data.m3 = data.frame(Y=Y.m3, X.m3)
#####
### Apply logistic regression with reduced models to the data sets
#####
logit.m1 <- glm(Y ~ X1 + X2, data = data.m1, family = "binomial")
# print(logit.m1)
if(logit.m1$converged == FALSE)
{
  print("glm for logit.m1 is not convergent.")
  next
}
logit.m2 <- glm(Y ~ X2 + X3, data = data.m2, family = "binomial")
# print(logit.m2)
if(logit.m2$converged == FALSE)
{
  print("glm for logit.m2 is not convergent.")
  next
}
logit.m3 <- glm(Y ~ X1 + X3, data = data.m3, family = "binomial")
# print(logit.m3)
if(logit.m3$converged == FALSE)
{
  print("glm for logit.m3 is not convergent.")
  next
}
#####
### Obtain the estimators of the parameters in the reduced models.
#####
theta.m1 = logit.m1$coefficients
theta.m2 = logit.m2$coefficients
theta.m3 = logit.m3$coefficients
#####
### Find the covariance matrix estimators for the reduced models
#####
#####
# Basic notations for inputs
#####
K = 3 # Number of data sets
A1 = c(1, 2) # index set A1, the indexes of the covariates of data set 1.
A2 = c(2, 3) # index set A2
A3 = c(1, 3) # index set A3
X.m1.used = cbind(rep(1, n1), X.m1[, A1, drop=FALSE])
X.m2.used = cbind(rep(1, n2), X.m2[, A2, drop=FALSE])
X.m3.used = cbind(rep(1, n3), X.m3[, A3, drop=FALSE])
# str(X.m1.used)
# str(X.m2.used)
# str(X.m3.used)
##### Find Sigma.m1
T.1 = matrix(rep(0, (length(A1)+1)^2), nrow=length(A1)+1)
T.2 = T.1
for (i in 1:n1)
{
a = as.vector(exp(-X.m1.used[i, , drop=FALSE]%*%theta.m1))
  T.1 = T.1 + (a/(1+a)^2) * (t(X.m1.used[i, , drop=FALSE])%*%X.m1.used[i, , drop=FALSE])
}
for (i in 1:n1)
{
  a = as.vector(1/( 1 + exp(-X.m1.used[i, , drop=FALSE]%*%theta.m1)))
  T.2 = T.2 + (Y.m1[i]-a)^2 * (t(X.m1.used[i, , drop=FALSE])%*%X.m1.used[i, , drop=FALSE])
}
Sigma.m1 = solve(T.1)%*%T.2%*%solve(T.1) # This is actually Sigma.m1.n1.
##### Find Sigma.m2
T.1 = matrix(rep(0, (length(A2)+1)^2), nrow=length(A2)+1)
T.2 = T.1
for (i in 1:n2)
{
  a = as.vector(exp(-X.m2.used[i, , drop=FALSE]%*%theta.m2))
  T.1 = T.1 + (a/(1+a)^2) * (t(X.m2.used[i, , drop=FALSE])%*%X.m2.used[i, , drop=FALSE])
}
for (i in 1:n2)
{
  a = as.vector(1/( 1 + exp(-X.m2.used[i, , drop=FALSE]%*%theta.m2)))
  T.2 = T.2 + (Y.m2[i]-a)^2 * (t(X.m2.used[i, , drop=FALSE])%*%X.m2.used[i, , drop=FALSE])
}
Sigma.m2 = solve(T.1)%*%T.2%*%solve(T.1)
##### Find Sigma.m3
T.1 = matrix(rep(0, (length(A3)+1)^2), nrow=length(A3)+1)
T.2 = T.1
for (i in 1:n3)
{
  a = as.vector(exp(-X.m3.used[i, , drop=FALSE]%*%theta.m3))
  T.1 = T.1 + (a/(1+a)^2) * (t(X.m3.used[i, , drop=FALSE])%*%X.m3.used[i, , drop=FALSE])
}
for (i in 1:n3)
{
  a = as.vector(1/( 1 + exp(-X.m3.used[i, , drop=FALSE]%*%theta.m3)))
  T.2 = T.2 + (Y.m3[i]-a)^2 * (t(X.m3.used[i, , drop=FALSE])%*%X.m3.used[i, , drop=FALSE])
}
Sigma.m3 = solve(T.1)%*%T.2%*%solve(T.1)
names(theta.m1)=c("(Intercept)","Age","Height")
names(theta.m2)=c("(Intercept)","Height", "Weight")
names(theta.m3)=c("(Intercept)","Age", "Weight")
study1 = list(Coeff=theta.m1,Covariance=Sigma.m1,Sample_size=n1)
study2 = list(Coeff=theta.m2,Covariance=Sigma.m2,Sample_size=n2)
study3 = list(Coeff=theta.m3,Covariance=Sigma.m3,Sample_size=n3)
studies = list(study1,study2,study3)
model = "logistic"
reference = cbind(rep(1,n), X.rf)
colnames(reference) = c("(Intercept)","Age","Height", "Weight")
result_diff <- GENMETA(studies, reference, model, variable_intercepts = TRUE)
GENMETA.plot(result_diff, studies)



