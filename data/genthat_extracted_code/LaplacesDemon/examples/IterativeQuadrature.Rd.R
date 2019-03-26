library(LaplacesDemon)


### Name: IterativeQuadrature
### Title: Iterative Quadrature
### Aliases: IterativeQuadrature
### Keywords: Adaptive Bayesian Inference Cubature Gauss-Hermite High
###   Performance Computing Initial Values Integration Numerical
###   Integration Quadrature Sparse Grid

### ** Examples

# The accompanying Examples vignette is a compendium of examples.
####################  Load the LaplacesDemon Library  #####################
library(LaplacesDemon)

##############################  Demon Data  ###############################
data(demonsnacks)
y <- log(demonsnacks$Calories)
X <- cbind(1, as.matrix(log(demonsnacks[,10]+1)))
J <- ncol(X)
for (j in 2:J) X[,j] <- CenterScale(X[,j])

#########################  Data List Preparation  #########################
mon.names <- "mu[1]"
parm.names <- as.parm.names(list(beta=rep(0,J), sigma=0))
pos.beta <- grep("beta", parm.names)
pos.sigma <- grep("sigma", parm.names)
PGF <- function(Data) {
     beta <- rnorm(Data$J)
     sigma <- runif(1)
     return(c(beta, sigma))
     }
MyData <- list(J=J, PGF=PGF, X=X, mon.names=mon.names,
     parm.names=parm.names, pos.beta=pos.beta, pos.sigma=pos.sigma, y=y)

##########################  Model Specification  ##########################
Model <- function(parm, Data)
     {
     ### Parameters
     beta <- parm[Data$pos.beta]
     sigma <- interval(parm[Data$pos.sigma], 1e-100, Inf)
     parm[Data$pos.sigma] <- sigma
     ### Log-Prior
     beta.prior <- sum(dnormv(beta, 0, 1000, log=TRUE))
     sigma.prior <- dhalfcauchy(sigma, 25, log=TRUE)
     ### Log-Likelihood
     mu <- tcrossprod(Data$X, t(beta))
     LL <- sum(dnorm(Data$y, mu, sigma, log=TRUE))
     ### Log-Posterior
     LP <- LL + beta.prior + sigma.prior
     Modelout <- list(LP=LP, Dev=-2*LL, Monitor=mu[1],
          yhat=rnorm(length(mu), mu, sigma), parm=parm)
     return(Modelout)
     }

############################  Initial Values  #############################
#Initial.Values <- GIV(Model, MyData, PGF=TRUE)
Initial.Values <- rep(0,J+1)

#########################  Adaptive Gauss-Hermite  ########################
#Fit <- IterativeQuadrature(Model, Initial.Values, MyData, Covar=NULL,
#     Iterations=100, Algorithm="AGH",
#     Specs=list(N=5, Nmax=7, Packages=NULL, Dyn.libs=NULL), CPUs=1)

##################  Adaptive Gauss-Hermite Sparse Grid  ###################
#Fit <- IterativeQuadrature(Model, Initial.Values, MyData, Covar=NULL,
#     Iterations=100, Algorithm="AGHSG",
#     Specs=list(K=5, Kmax=7, Packages=NULL, Dyn.libs=NULL), CPUs=1)

#################  Componentwise Adaptive Gauss-Hermite  ##################
#Fit <- IterativeQuadrature(Model, Initial.Values, MyData, Covar=NULL,
#     Iterations=100, Algorithm="CAGH",
#     Specs=list(N=3, Nmax=10, Packages=NULL, Dyn.libs=NULL), CPUs=1)

#Fit
#print(Fit)
#PosteriorChecks(Fit)
#caterpillar.plot(Fit, Parms="beta")
#plot(Fit, MyData, PDF=FALSE)
#Pred <- predict(Fit, Model, MyData, CPUs=1)
#summary(Pred, Discrep="Chi-Square")
#plot(Pred, Style="Covariates", Data=MyData)
#plot(Pred, Style="Density", Rows=1:9)
#plot(Pred, Style="Fitted")
#plot(Pred, Style="Jarque-Bera")
#plot(Pred, Style="Predictive Quantiles")
#plot(Pred, Style="Residual Density")
#plot(Pred, Style="Residuals")
#Levene.Test(Pred)
#Importance(Fit, Model, MyData, Discrep="Chi-Square")

#End



