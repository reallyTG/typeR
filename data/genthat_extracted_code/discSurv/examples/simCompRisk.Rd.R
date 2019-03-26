library(discSurv)


### Name: simCompRisk
### Title: Simulation of Competing Risks data
### Aliases: simCompRisk
### Keywords: datagen

### ** Examples

library(Matrix)
library(matrixcalc)

########################
# Design of Simulation

# Monte carlo samples for each design = 10
# SampleSize = 100 in each replicate

# Responses: 
# R1 i.n.d. ~ Weibull (shape=0.5, scale=exp(eta)) 
# E(R1) = gamma (3)*exp(eta)
# R2 i.n.d. ~ Weibull (shape=1, scale=exp(eta))
# E(R2) = gamma (2)*exp(eta)
# R3 i.n.d. ~ Weibull (shape=2, scale=exp(eta))
# E(R3) = gamma (1.5)*exp(eta)

# Random Censoring
# Z = 2/3 * (gamma (3) + gamma (2) + gamma (1.5)) = 2.590818
# Independent of survival times C_i i.i.d ~ Exp (lambda=Z)

# Correlation structure of survival times:
# Specify with kendalls tau -> spearmans rho
# Kendalls tau matrix:
# R1   R2   R3
# R1  1   0.3  0.4
# R2  0.3   1  0.5
# R3  0.4 0.5    1

# Covariates: 
# V1: Binary variable ~ Bin (n=2, pi=0.5) -> E (V1) = 1
# V2: Continuous positive variable ~ Gamma (shape=1, scale=1) -> E (V2) = 1
# V3: Continuous variable ~ Normal (mu=0, sigma^2=1) -> E (V5) = 0

# True linear predictor:
# eta = X %*% beta
# beta_1 = c(-0.5, 1, 0.5)
# beta_2 = c(1, -1, 1)
# beta_3 = c(-0.5, -0.5, 2)

# Correlation Structure in Covariates:
# Specify with kendalls tau -> pearsons rho
# V1    V2     V3
# V1       1 -0.25      0
# V2   -0.25     1   0.25
# V3       0  0.25      1

# Design Correlation Matrix of covariates
DesignCovariateCor <- diag(3)
DesignCovariateCor [lower.tri(DesignCovariateCor)] <- c(-0.25, 0, 0.25)
DesignCovariateCor [upper.tri(DesignCovariateCor)] <- c(-0.25, 0, 0.25)

# Check if correlation matrix is symmetric
sum(DesignCovariateCor-t(DesignCovariateCor))==0 # TRUE -> ok
# Check if correlation matrix is positive definite
is.positive.definite (DesignCovariateCor) # TRUE -> ok
# Check if correlation matrix is transformed pearson matrix is positive, definite
is.positive.definite (apply(DesignCovariateCor, c(1,2), tauToPearson)) # TRUE -> ok

# Design Correlation Matrix positive definite after transformation
DesignResponseCor <- diag(3)
DesignResponseCor [lower.tri(DesignResponseCor)] <- c(0.3, 0.4, 0.5)
DesignResponseCor [upper.tri(DesignResponseCor)] <- c(0.3, 0.4, 0.5) 

# Check if response correlation matrix is symmetric
sum(DesignResponseCor-t(DesignResponseCor))==0
# Check if response correlation matrix is positive definite
is.positive.definite (DesignResponseCor)
# Check if response correlation matrix is transformed pearson matrix is positive, definite
is.positive.definite (apply(DesignResponseCor, c(1,2), tauToPearson))

# Simulate raw data
DesignSampleSize <- 100
MonteCarloSamples <- 10
SimOutput <- vector("list", MonteCarloSamples)
for(j in 1:MonteCarloSamples) {
  SimOutput [[j]] <- simCompRisk (responseCorr=DesignResponseCor, covariateCorr=DesignCovariateCor, 
	  covariateSeed=NULL, sampleSize=100, covariateQuantFunc=c("qbinom", "qgamma", "qnorm"), 
	  covariateArgs=list(c(size=2, prob=0.5), c(shape=1, scale=1), c(mean=0, sd=1)), 
	  intercept=c(FALSE, FALSE, FALSE), 
	  trueCoef=list(c(-0.5, 1, 0.5), c(1, -1, 1), c(-0.5, -0.5, 2)), 
	  responseSeed=NULL, responseQuantFunc=c("qweibull", "qweibull", "qweibull"), 
	  responseFixArgs=list(c(shape=0.5), c(shape=1), c(shape=2)), 
	  responseLinPredArgs=list(list(scale=function (x) {exp(x)}), 
	  list(scale=function (x) {exp(x)}), 
	  list(scale=function (x) {exp(x)})), censorRN="rexp", 
	  censorArgs=c(rate=2/3 * (gamma (3) + gamma (2) + gamma (1.5))), censorSeed=NULL)
}
SimOutput [[1]]
SimOutput [[5]]

OverviewData <- data.frame(Min=rep(NA, MonteCarloSamples), 
Max=rep(NA, MonteCarloSamples), Censrate=rep(NA, MonteCarloSamples))
for(j in 1:MonteCarloSamples) {
  
  # Calculate Range of observed time
  OverviewData [j, 1:2] <- range (SimOutput [[j]]$Data [, "Time"])
  
  # Calculate censoring rate
  OverviewData [j, "Censrate"] <- mean(SimOutput [[j]]$Data [, "Censor"])
  
}
OverviewData



