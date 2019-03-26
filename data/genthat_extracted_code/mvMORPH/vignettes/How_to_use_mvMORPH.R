## ---- results="hide", message=FALSE--------------------------------------
# Load the package and dependencies (ape, phytools, corpcor, subplex)
library(mvMORPH)

## ---- comment=">", results="hide"----------------------------------------
# Use a specified random number seed for reproducibility
set.seed(14)
par(mfrow=c(1,3))
tree <- pbtree(n=10)

# Set a different regime to the monophyletic group on node "12"
tree2 <- paintSubTree(tree, node=12, state="group_2", anc.state="group_1")
plot(tree2);nodelabels(,cex=0.8)

# We can set the character state to the stem branch leading to the subtree
tree3 <- paintSubTree(tree, node=12, state="group_2", anc.state="group_1", stem=TRUE)
plot(tree3)

# Finally we can also set a different regime to the branch leading to the tip "t10"
branch_1 <- match("t10",tree3$tip.label) # alternatively: which(tree$tip.label=="t10")
tree4 <- paintBranches(tree3, branch_1, state="group_1")

# set also a change to a third state along the branch 
# leading to "t2" using the "stem" argument
branch_2 <- match("t2",tree3$tip.label) 
tree4 <- paintSubTree(tree4, branch_2, state="group_3", stem=0.5)
plot(tree4)

## ---- comment=">"--------------------------------------------------------
# Make a tiny time-series object from fossil ages within [55; 32.5] Ma
fossil_ages <- c(55,46,43,38,35,32.5)

# The time-series becomes:
timeseries <- max(fossil_ages)-fossil_ages
timeseries

## ---- comment=">", eval=FALSE--------------------------------------------
#  set.seed(14)
#  # Generating a random tree with 50 species
#  tree<-pbtree(n=50)
#  
#  # Setting the regime states of tip species
#  sta<-as.vector(c(rep("Forest",20),rep("Savannah",30))); names(sta)<-tree$tip.label
#  
#  # Making the simmap tree with mapped states
#  tree<-make.simmap(tree, sta , model="ER", nsim=1)
#  
#  # Number of simulated datasets
#  nsim<-1
#  
#  # Rates matrices for the "Forest" and the "Savannah" regimes
#  # Note: use lists for multiple rates (matrices or scalars)
#  sigma<-list(Forest=matrix(c(2,0.5,0.5,1),2), Savannah=matrix(c(5,3,3,4),2))
#  
#  # ancestral states for each traits
#  theta<-c(0,0)
#  
#  # Simulate the "BMM" model
#  simul_1<-mvSIM(tree, nsim=nsim, model="BMM", param=list(sigma=sigma, theta=theta))
#  
#  head(simul_1)

## ---- comment=">", results="hide", eval=FALSE----------------------------
#  # fit the BMM model on simulated data
#  fit <- mvBM(tree, simul_1)
#  
#  # simulate 100 datasets from the fitted object
#  simul_2 <- simulate(fit, tree=tree, nsim=100)
#  
#  # parametric bootstrap; e.g.:
#  bootstrap <- lapply(simul_2, function(x) mvBM(tree, x, echo=F, diagnostic=F))
#  
#  # retrieve results; e.g. for the log-likelihood
#  log_distribution <- sapply(bootstrap, logLik)
#  
#  hist(log_distribution, main="Log-likelihood distribution")
#  abline(v=fit$LogLik, lty=2, lwd=5, col="red")

## ----comment=">"---------------------------------------------------------
set.seed(1)
n <- 32 # number of species
p <- 50 # number of traits (p>n)

tree <- pbtree(n=n, scale=1) # phylogenetic tree
R <- crossprod(matrix(rnorm(p*p), ncol=p)) # a random symmetric matrix (covariance)
# simulate a BM dataset
Y <- mvSIM(tree, model="BM1", nsim=1, param=list(sigma=R, theta=rep(0,p)))
data=list(Y=Y)

# High dimensional model fit
fit1 <- mvgls(Y~1, data=data, tree, model="BM", penalty="RidgeArch")
fit2 <- mvgls(Y~1, data=data, tree, model="OU", penalty="RidgeArch")
fit3 <- mvgls(Y~1, data=data, tree, model="EB", penalty="RidgeArch")

GIC(fit1); GIC(fit2); GIC(fit3) # BM have the lowest GIC value (see # Model comparison)

# We can also use the model fit to perform a phylogenetic PCA
# mvgls.pca(fit1)

# Regression model with Pagel's lambda estimation
data=list(Y=Y, X=rnorm(n))
mvgls(Y~X, data=data, tree, model="lambda", penalty="RidgeArch")

## ---- comment=">", results="hide"----------------------------------------
set.seed(1)
tree <- pbtree(n=50)
# Simulate the traits
sigma<-matrix(c(0.1,0.05,0.05,0.1),2)
theta<-c(0,0)
data<-mvSIM(tree, param=list(sigma=sigma, theta=theta), model="BM1", nsim=1)

# Fit three nested models
fit_1 <- mvBM(tree, data, model="BM1")
fit_2 <- mvBM(tree, data, model="BM1", param=list(constraint="equal"))
fit_3 <- mvBM(tree, data, model="BM1", param=list(constraint="diagonal"))

## ----comment=">"---------------------------------------------------------
# Compare their AIC values
AIC(fit_1); AIC(fit_2); AIC(fit_3)

# Likelihood Ratio Test:
LRT(fit_1, fit_2) # test non-significant as expected!
LRT(fit_1, fit_3)

# Compute the Akaike weights:
results <- list(fit_1,fit_2,fit_3)
weights <- aicw(results)
weights

# Model averaging of the evolutionary covariance
mdavg <- lapply(1:3, function(x) results[[x]]$sigma*weights$aicw[x])
Evol_cov <- Reduce('+',mdavg)
Evol_cov

# Is the model averaging better than the best fitting model in this example?
# which.min(c(mean((sigma-fit_2$sigma)^2),mean((sigma-Evol_cov)^2)))

# Get the evolutionary correlations:
cov2cor(Evol_cov)
# with more than 2 traits you can compute the conditional (or partial) correlations
cor2pcor(Evol_cov)

# Model averaging for the root state
mdavg <- lapply(1:3, function(x) results[[x]]$theta*weights$aicw[x])
Evol_theta <- Reduce('+',mdavg)

## ----comment=">", message=FALSE, results='hide'--------------------------
set.seed(100)
tree<-rtree(100)

# Simulate the traits
alpha<-matrix(c(0.2,0.05,0.05,0.1),2)
sigma<-matrix(c(0.1,0.05,0.05,0.1),2)
theta<-c(0,2,0,1.3)
data<-mvSIM(tree, param=list(sigma=sigma, alpha=alpha, 
                             theta=theta, root=TRUE), model="OU1", nsim=1)
            
mvOU(tree, data, model="OU1", param=list(root=TRUE))

## ---- comment=">", message=FALSE, results='hide'-------------------------
# timeseries 
ts <- 0:49
sigma<-matrix(c(0.1,0.05,0.05,0.1),2)
alpha <- matrix(c(1,0.5,0.5,0.8),2,2)
theta<-c(0,2,0,1)
data<-mvSIM(ts, param=list(sigma=sigma, alpha=alpha, 
                             theta=theta, root=TRUE), model="OUTS", nsim=1)

mvOUTS(ts, data, param=list(root=TRUE))
mvOUTS(ts, data, param=list(root=FALSE))

## ----comment=">", results='hide', message=FALSE--------------------------
# BM model with two selective regimes
set.seed(1)
tree<-pbtree(n=50)

# Setting the regime states of tip species
sta<-as.vector(c(rep("Forest",20),rep("Savannah",30))); names(sta)<-tree$tip.label

# Making the simmap tree with mapped states
tree<-make.simmap(tree,sta , model="ER", nsim=1)

# Simulate the traits
sigma<-matrix(c(0.1,0.05,0.05,0.1),2)
theta<-c(0,2,0,2)
data<-mvSIM(tree, param=list(sigma=sigma, theta=theta, smean=FALSE), model="BM1", nsim=1)
            
# fit the models with and without multiple phylogenetic mean, and different rates matrix
fit_1 <- mvBM(tree, data, model="BM1")
fit_2 <- mvBM(tree, data, model="BMM")
fit_3 <- mvBM(tree, data, model="BM1", param=list(smean=FALSE))
fit_4 <- mvBM(tree, data, model="BMM", param=list(smean=FALSE))

## ----comment=">"---------------------------------------------------------
# Compare the fitted models.
results <- list(fit_1,fit_2,fit_3,fit_4)
aicw(results, aicc=TRUE)


## ----comment=">", results='hide'-----------------------------------------
# Simulated dataset
set.seed(1)
# Generating a random non-ultrametric tree
tree<-rtree(100)

# Simulate the traits
sigma<-matrix(c(0.1,0.05,0.05,0.1),2)
theta<-c(0,0)
trend<-c(0.2,0.2)
data<-mvSIM(tree, param=list(sigma=sigma, trend=trend, theta=theta,
                   names_traits=c("head.size","mouth.size")), model="BM1", nsim=1)

# model without trend
fit_1 <- mvBM(tree, data, param=list(trend=FALSE), model="BM1")
# model with independent trends
fit_2 <- mvBM(tree, data, param=list(trend=TRUE), model="BM1")
# model with similar trend for both traits
fit_3 <- mvBM(tree, data, param=list(trend=c(1,1)), model="BM1") 

## ----comment=">"---------------------------------------------------------
results <- list(fit_1,fit_2,fit_3)
aicw(results)

# are the differences between trends significant?
LRT(fit_2,fit_3) # No... as expected

## ----comment=">", results='hide', message=FALSE--------------------------
# Simulate the time serie and data
timeseries  <- 0:49
error <- matrix(0, nrow=50, ncol=2); error[1,] <- 0.001
data<-mvSIM(timeseries , error=error, model="RWTS", 
            param=list(sigma=sigma, theta=theta, trend=trend), nsim=1)

# plot the time serie
matplot(data, type="o", pch=1, xlab="Time (relative)")

# model fit
fit1 <- mvRWTS(timeseries , data, error)
fit2 <- mvRWTS(timeseries , data, error, param=list(trend=c(1,1)))

## ---- comment=">"--------------------------------------------------------
LRT(fit2,fit1)

## ---- results="hide", comment=">", message=FALSE-------------------------
set.seed(14)
# Generating a random tree
tree<-pbtree(n=50)

# Simulate 3 traits
sigma <- matrix(c(0.01,0.005,0.003,0.005,0.01,0.003,0.003,0.003,0.01),3)
theta<-c(0,0,0)
data<-mvSIM(tree, model="BM1", nsim=1, param=list(sigma=sigma, theta=theta))

# Fit user-defined contrained model
user_const <- matrix(c(1,4,4,4,2,5,4,5,3),3)
fit1 <- mvBM(tree, data, model="BM1", method="pic"
             , param=list(constraint=user_const), optimization="subplex")

# only rates/variances are changing
user_const <- matrix(c(1,3,3,3,2,3,3,3,2),3)
fit2 <- mvBM(tree, data, model="BM1", param=list(constraint=user_const)
             , method="pic", optimization="subplex")

## ----comment=">"---------------------------------------------------------
# Some covariances constrained to zero
user_const <- matrix(c(1,4,4,4,2,NA,4,NA,3),3)

print(user_const)

fit3 <- mvBM(tree, data, model="BM1", method="pic"
             , param=list(constraint=user_const), optimization="subplex")


## ---- comment=">", results='hide'----------------------------------------
set.seed(14)
tree <- rtree(50)
alpha<-matrix(c(0.6,0,-0.6,0.3),2)
sigma<-matrix(c(0.01,0.005,0.005,0.01),2)
theta <- matrix(c(0,1,0,1.3),2)
# Simulate two correlated traits evolving along the phylogeny
# e.g. brain size is lagging behind body-size
# as in Deaner & Nunn 1999 - PRSB
data<-mvSIM(tree,nsim=1, model="OU1",
            param=list(sigma=sigma, alpha=alpha, theta=theta, root=TRUE, 
                       names_traits=c("brain-size","body-size")))

# No detectable lag:
fit_1 <- mvOU(tree, data, model="OU1", param=list(root=TRUE))
# Brain size lag behind body size (the simulated model!)
fit_2 <- mvOU(tree, data, model="OU1", param=list(decomp="upper", root=TRUE)) 
# Body size lag behind brain-size
fit_3 <- mvOU(tree, data, model="OU1", param=list(decomp="lower", root=TRUE))

## ---- comment=">"--------------------------------------------------------
results <- list(fit_1, fit_2, fit_3)
aicw(results)

## ----comment=">"---------------------------------------------------------
# try user defined constraints
set.seed(100)
ts <- 50
timeseries  <- 0:ts

sigma <- matrix(c(0.01,0.005,0.003,0.005,0.01,0.003,0.003,0.003,0.01),3)
# upper triangular matrix with effect of trait 2 on trait 1.
alpha <- matrix(c(0.4,0,0,-0.5,0.3,0,0,0,0.2),3,3) 
theta <- matrix(c(0,0,0,1,0.5,0.5),byrow=T, ncol=3); root=TRUE

data <- mvSIM(timeseries , model="OUTS", param=list(alpha=alpha, 
              sigma=sigma, theta=theta, root=root, 
              names_traits=c("sp 1", "sp 2", "sp 3")))

# plot
matplot(data, type="o", pch=1, xlab="Time (relative)")
legend("bottomright", inset=.05, legend=colnames(data), pch=19, col=c(1,2,3), horiz=TRUE)

## ---- comment=">", results="hide", message=FALSE, eval=FALSE-------------
#  # define an user constrained drift matrix
#  indice <- matrix(NA,3,3)
#  diag(indice) <- c(1,2,3)
#  indice[1,2] <- 4
#  
#  # fit the models
#  fit_1 <- mvOUTS(timeseries , data, param=list(vcv="fixedRoot", decomp=indice))
#  fit_2 <- mvOUTS(timeseries , data, param=list(vcv="fixedRoot", decomp="diagonal"))
#  
#  LRT(fit_1, fit_2)

## ---- comment=">", results='hide'----------------------------------------
set.seed(1)
# simulate a tree scaled to unit length
tree <- pbtree(n=100, scale=1)

theta <- c(0,2) # the ancestral state and the optimum
sigma <- 1
alpha <- 0.1 # large half-life
trait <- mvSIM(tree, nsim=1, model="OU1", 
               param=list(theta=theta, sigma=sigma, alpha=alpha, root=TRUE))

# fit the models
fit_1 <- mvOU(tree, trait, model="OU1", param=list(vcv="randomRoot"))
fit_2 <- mvOU(tree, trait, model="OU1", param=list(vcv="fixedRoot"))

# Simulate with a stronger effect
alpha <- 6 # small half-life ~10% of the tree height
trait <- mvSIM(tree, nsim=1, model="OU1", 
               param=list(theta=theta, sigma=sigma, alpha=alpha, root=TRUE))

# fit the models
fit_3 <- mvOU(tree, trait, model="OU1", param=list(vcv="randomRoot"))
fit_4 <- mvOU(tree, trait, model="OU1", param=list(vcv="fixedRoot"))


## ---- comment=">"--------------------------------------------------------
# compare the log-likelihood
abs(logLik(fit_1))-abs(logLik(fit_2)) # large half-life
abs(logLik(fit_3))-abs(logLik(fit_4)) # small half-life


## ---- comment=">", results="hide"----------------------------------------
set.seed(1)
tree <- pbtree(n=50)
# Simulate the traits
sigma<-matrix(c(0.1,0.05,0.05,0.1),2)
theta<-c(0,0)
data<-mvSIM(tree, param=list(sigma=sigma, theta=theta), model="BM1", nsim=1)

# Fit the model
fit <- mvBM(tree, data, model="BM1")

## ---- comment=">", results="hide"----------------------------------------
# the loglik function (the order of parameter is printed:)
fit$llik

## ---- comment=">"--------------------------------------------------------
# Use the maximum likelihood parameters from the optimizer
par <- fit$param$opt$par
fit$llik(par)

all.equal(fit$llik(par),logLik(fit)) # similar results

# Return also the analytic MLE for theta
fit$llik(par, theta=TRUE)

## ---- comment=">"--------------------------------------------------------
# Use the maximum likelihood parameters from the optimizer
fit$llik(c(par,fit$theta), root.mle=FALSE)


## ---- comment=">"--------------------------------------------------------
# Reconstruct sigma with the untransformed values of the optimizer
sigma <- fit$param$sigmafun(par)

all.equal(as.vector(sigma), as.vector(fit$sigma))

## ---- comment=">"--------------------------------------------------------
# Return the log-likelihood function only
fit <- mvBM(tree, data, model="BM1", optimization="fixed")


## ---- results='hide'-----------------------------------------------------
# Simulated dataset
set.seed(14)
# Generating a random tree
tree<-rtree(50)

# Simulate two correlated traits evolving along the phylogeny
sigma<-matrix(c(0.1,0.05,0.05,0.1),2); theta<-c(0,2)
traits<-mvSIM(tree, model="BM1", param=list(sigma=sigma, theta=theta))

# Introduce some missing cases (NA values)
data<-traits
data[8,2]<-NA
data[25,1]<-NA

# Fit of model 1
fit_1<-mvBM(tree,data,model="BM1")

## ---- comment=">"--------------------------------------------------------
# Estimate the missing cases
imp<-estim(tree, data, fit_1, asr=FALSE)

# Check the imputed data
imp$estim[1:10,]

## ---- comment=">"--------------------------------------------------------
plot(tree, cex=0.6)
nodelabels(, cex=0.6)

# Estimate the ancestral states
asr<-estim(tree, data, fit_1, asr=TRUE)
asr$estim[1:10,]

## ----comment=">"---------------------------------------------------------
set.seed(123)
# Here I show a simple example of model fitting using mvMORPH
tree <- pbtree(n=100)

# 1) Create a model, e.g. the Kappa model of Pagel 1999
phylo_kappa <- function(tree, kappa){
  tree$edge.length <- tree$edge.length ^ kappa
  return(tree)
}

# just to compare the trees
par(mfrow=c(1,2))
plot(tree, show.tip.label=FALSE, main="untransformed tree")
plot(phylo_kappa(tree, 0.5), show.tip.label=FALSE, main="Kappa model")

# 2) Create the log-likelihood function

log_lik <- function(par, tree, data){
  tree_transf <- phylo_kappa(tree, par)
  result <- mvLL(tree_transf, data, method="pic")
  return(list(logl=result$logl, theta=result$theta, sigma=result$sigma))
}

# 3) optimize it!

# create fake data
trait <- rTraitCont(phylo_kappa(tree, 0.7))

# guess for the optimization
guess_value <- 0.5

# optimize the model!
fit <- optim(guess_value, function(par){log_lik(par, tree, trait)$logl},
             method="L-BFGS-B", lower=0, upper=1, control=list(fnscale=-1))

result <- data.frame(logLik=fit$value, kappa=fit$par, sigma2=log_lik(fit$par, tree,
                              trait)$sigma, theta=log_lik(fit$par, tree, trait)$theta )
rownames(result) <- "Model fit"

# print the result
print(result)


# Do the same for a multivariate model:
# simulate traits independently
trait <-cbind( rTraitCont(phylo_kappa(tree, 0.7)), rTraitCont(phylo_kappa(tree, 0.7)))

log_lik <- function(par, tree, data){
  # transform the tree for each traits
  tree_transf <- list(phylo_kappa(tree, par[1]), phylo_kappa(tree, par[2]))
  result <- mvLL(tree_transf, data, method="pic")
  return(list(logl=result$logl, theta=result$theta, sigma=result$sigma))
}

# fit
guess_value <- c(0.5,0.5)
fit <- optim(guess_value, function(par){log_lik(par, tree, trait)$logl},
             method="L-BFGS-B", lower=0, upper=1, control=list(fnscale=-1))

result <- list(logLik=fit$value, kappa=fit$par, sigma2=log_lik(fit$par, tree,
                              trait)$sigma, theta=log_lik(fit$par, tree, trait)$theta)
# as expected the covariances are low
print(result)

## ----comment=">"---------------------------------------------------------
set.seed(123)
# Simulate the time serie
timeseries <- 0:99

# Simulate the traits
sigma_1 <- matrix(c(0.015,0.005,0.005,0.01),2)
sigma_2 <- matrix(c(0.03,0.01,0.01,0.02),2)
theta <- c(0.5,1)
error <- matrix(0,ncol=2,nrow=100);error[1,]=0.001
data_1<-mvSIM(timeseries , error=error, 
              param=list(sigma=sigma_1, theta=theta), model="RWTS", nsim=1)
data_2<-mvSIM(timeseries +100, error=error,
              param=list(sigma=sigma_2, theta=data_1[100,]), model="RWTS", nsim=1)
data <- rbind(data_1,data_2)

# plot the time serie
matplot(data, type="o", pch=1, xlab="Time (relative)", cex=0.8)

# 1) log-likelihood function
fun_ts_1 <- mvRWTS(timeseries , data_1, error=error, optimization="fixed")
fun_ts_2 <- mvRWTS(timeseries +100, data_2, error=error, optimization="fixed")

# a model of shift
log_lik_RWshift <- function(par){
  # compute the log-likelihood for the first bin
  part1 <- fun_ts_1$llik(par[1:3], theta=TRUE)
  # compute the log-likelihood for the second bin using the 
  # expectation of the first bin and sigma2
  part2 <- fun_ts_2$llik(c(par[4:6],part1$theta), root.mle=FALSE)
  
  # the log-likelihood
  ll1 <- part1$logl; ll2 <- part2
  return(ll1+ll2)
}

# 2) starting values (only for sigma because theta is computed analytically)
guess_value <- c(chol(sigma_1)[upper.tri(sigma_1, diag=TRUE)], 
                 chol(sigma_2)[upper.tri(sigma_2, diag=TRUE)])

# optimize the model!
fit <- optim(guess_value, function(par){log_lik_RWshift(par)},
             method="Nelder-Mead", control=list(fnscale=-1))

# plot the results
results <- list(sigma_1=fun_ts_1$param$sigmafun(fit$par[1:3]), 
                sigma_2=fun_ts_2$param$sigmafun(fit$par[4:6]), 
                theta=fun_ts_1$llik(fit$par[1:3], theta=TRUE)$theta,
                llik=fit$value)
print(results)



## ---- comment=">", results="hide", eval=FALSE----------------------------
#  set.seed(1)
#  tree <- pbtree(n=50)
#  # Simulate the traits
#  sigma<-matrix(c(0.1,0.05,0.05,0.1),2)
#  theta<-c(0,0)
#  data<-mvSIM(tree, param=list(sigma=sigma, theta=theta), model="BM1", nsim=1)
#  
#  # Retrieve the log-likelihood of the model (we can use optimization="fixed")
#  bm_model <- mvBM(tree, data, model="BM1", method="pic")
#  
#  # define weakly informative prior for the correlations and standard deviations separately
#  prior <- function(x){
#    a <- dunif(x[1],min=0, max=pi, TRUE) # prior for the angles
#    b <- dunif(x[2],min=1e-5, max=0.4, TRUE) # prior for the standard deviations of trait 1
#    c <- dunif(x[3],min=1e-5, max=0.4, TRUE) # prior for the standard deviations of trait 2
#    return(a+b+c)
#  }
#  
#  # define the log-likelihood distribution
#  log_lik <- function(par){
#    ll <- bm_model$llik(par)
#    pr <- prior(par)
#    return(ll+pr)
#  }
#  
#  # Use an mcmc sampler
#  require(spBayes)
#  require(coda)
#  start_val <- bm_model$param$opt$par #the ML values
#  n.batch <- 500
#  l.batch <- 25
#  
#  # run the mcmc
#  fit <- adaptMetropGibbs(log_lik, starting=start_val, batch=n.batch, batch.length=l.batch)
#  
#  # plot the results
#  chain <- mcmc(fit$p.theta.samples)
#  plot(chain)
#  
#  # check the distribution of the transformed values
#  rate_matrix <- t(apply(fit$p.theta.samples, 1, bm_model$param$sigmafun))
#  colnames(rate_matrix) <- c("Sigma [1,1]","Sigma [1,2]","Sigma [2,1]","Sigma [2,2]")
#  chain2 <- mcmc(rate_matrix)
#  plot(chain2)

