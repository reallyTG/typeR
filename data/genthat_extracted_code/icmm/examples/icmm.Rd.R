library(icmm)


### Name: icmm
### Title: Empirical Bayes Variable Selection
### Aliases: icmm

### ** Examples

# Normal linear regression model
# With no prior on structure among predictors
data(simGaussian)
Y<-as.matrix(simGaussian[,1])
X<-as.matrix(simGaussian[,-1])
# Obtain initial values from lasso
data(initbetaGaussian)
initbeta<-as.matrix(initbetaGaussian)
result<-icmm(Y=Y, X=X, b.start=initbeta, family="gaussian", 
        ising.prior=FALSE, estalpha=FALSE, alpha=0.5, maxiter=100)
result$coef
result$iterations
result$alpha
result$wpost

# With prior on structure among predictors
data(linearrelation)
result<-icmm(Y=Y, X=X, b.start=initbeta, family="gaussian", 
        ising.prior=TRUE, structure=linearrelation, 
        estalpha=FALSE, alpha=0.5, maxiter=100)
result$coef
result$iterations
result$alpha
result$wpost

# Binary logistic regression model
data(simBinomial)
Y<-as.matrix(simBinomial[,1])
X<-as.matrix(simBinomial[,-1])
p<-dim(X)[2]
# Obtain initial values from lasso
data(initbetaBinomial)
initbeta<-as.matrix(initbetaBinomial)
result<-icmm(Y=Y, X=X, b0.start=0, b.start=initbeta, family="binomial", 
        ising.prior=TRUE, structure=linearrelation, estalpha=FALSE, 
        alpha=0.5, maxiter=100)
result$coef
result$iterations
result$alpha
result$wpost

# Cox's model
data(simCox)
Y<-as.matrix(simCox[,1])
event<-as.matrix(simCox[,2])
X<-as.matrix(simCox[,-(1:2)])
# Obtain initial values from lasso
data(initbetaCox)
initbeta<-as.matrix(initbetaCox)
result <- icmm(Y=Y, X=X, event=event, b.start=initbeta, family="cox",
          ising.prior=TRUE, structure=linearrelation, estalpha=FALSE,
          alpha=0.5, maxiter=100)
result$coef
result$iterations
result$alpha
result$wpost



