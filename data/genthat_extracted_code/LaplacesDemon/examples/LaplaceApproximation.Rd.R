library(LaplacesDemon)


### Name: LaplaceApproximation
### Title: Laplace Approximation
### Aliases: LaplaceApproximation
### Keywords: Adaptive Bayesian Inference BFGS BHHH Conjugate Gradient DFP
###   Gradient Ascent High Performance Computing Hit-And-Run Hooke-Jeeves
###   Initial Values Limited-Memory BFGS Levenberg-Marquardt Nelder-Mead
###   Newton-Raphson Optimization Particle Swarm Optimization Resilient
###   Backpropagation Self-Organizing Migration Algorithm Spectral
###   Projected Gradient Stochastic Gradient Descent Symmetric Rank-One
###   Trust Region

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

Fit <- LaplaceApproximation(Model, Initial.Values, Data=MyData,
     Iterations=100, Method="NM", CPUs=1)
Fit
print(Fit)
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

#Fit$Covar is scaled (2.38^2/d) and submitted to LaplacesDemon as Covar.
#Fit$Summary[,1] is submitted to LaplacesDemon as Initial.Values.
#End



