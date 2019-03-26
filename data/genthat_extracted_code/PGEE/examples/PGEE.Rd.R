library(PGEE)


### Name: PGEE
### Title: Function to fit penalized generalized estimating equations
### Aliases: PGEE PGee mycor_gee2 q_scad S_H_E_M print.PGEE
###   print.summary.PGEE summary.PGEE print.PGee print.summary.PGee
###   summary.PGee

### ** Examples

# Consider an example similar to example 1 
# in Wang et al. (2012).

# required R package 
library(mvtnorm)
# number of subjects
n <- 200
# number of covariates 
pn <- 10
# number of time points
m <- 4

# vector if subject ids
id.vect <- rep(1:n, each = m) 

# covariance matrix of (pn-1) number of continuous covariates 
X.sigma <- matrix(0,(pn-1),(pn-1))
{
for (i in 1:(pn-1))
X.sigma[i,] <- 0.5^(abs((1:(pn-1))-i))  
}

# generate matrix of covariates    
x.mat <- as.matrix(rmvnorm(n*m, mean = rep(0,(pn-1)), X.sigma))
x.mat <- cbind(rbinom(n*m,1, 0.5), x.mat)

# true values
beta.true <- c(2,3,1.5,2,rep(0,6))
sigma2 <- 1
rho <- 0.5
R <- matrix(rho,m,m)+diag(rep(1-rho,m))

# covariance matrix of error
SIGMA <- sigma2*R
error <- rmvnorm(n, mean = rep(0,m),SIGMA)

# generate longitudinal data with continuous outcomes
y.temp <- x.mat%*%beta.true
y.vect <- y.temp+as.vector(t(error))

mydata <- data.frame(id.vect,y.vect,x.mat) 
colnames(mydata) <- c("id","y",paste("x",1:length(beta.true),sep = ""))

###Input Arguments for CVfit fitting###
library(PGEE)
formula <- "y ~.-id-1"
data <- mydata
family <- gaussian(link = "identity")
lambda.vec <- seq(0.1,1,0.1)

## Not run: 
##D cv <- CVfit(formula = formula, id = id, data = data, family = family,
##D fold = 4, lambda.vec = lambda.vec, pindex = NULL, eps = 10^-6, maxiter = 30, 
##D tol = 10^-3)
##D 
##D names(cv)
##D cv$lam.opt
## End(Not run)

lambda <- 0.1 #this value obtained through CVfit

# analyze the data through penalized generalized estimating equations

myfit1 <- PGEE(formula = formula, id = id, data = data, na.action = NULL, 
family = family, corstr = "exchangeable", Mv = NULL, 
beta_int = c(rep(0,length(beta.true))), R = NULL, scale.fix = TRUE, 
scale.value = 1, lambda = lambda, pindex = NULL, eps = 10^-6, maxiter = 30, 
tol = 10^-3, silent = TRUE)

summary(myfit1)

# analyze the data through unpenalized generalized estimating equations

myfit2 <- MGEE(formula = formula, id = id, data = data, na.action = NULL, 
family = family, corstr = "exchangeable", Mv = NULL, 
beta_int = c(rep(0,length(beta.true))), R = NULL, scale.fix = TRUE, 
scale.value = 1, maxiter = 30, tol = 10^-3, silent = TRUE)

summary(myfit2)



