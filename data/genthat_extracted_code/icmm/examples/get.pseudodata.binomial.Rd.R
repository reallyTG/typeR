library(icmm)


### Name: get.pseudodata.binomial
### Title: Obtain pseudodata based on the binary logistic regression model.
### Aliases: get.pseudodata.binomial

### ** Examples

data(simBinomial)
Y<-as.matrix(simBinomial[,1])
X<-as.matrix(simBinomial[,-1])
p<-dim(X)[2]
# Obtain initial values from lasso
data(initbetaBinomial)
initbeta<-as.matrix(initbetaBinomial)
# Get Pseudodata
pseudodata<-get.pseudodata.binomial(Y=Y, X=X, beta0=0, beta=initbeta, niter=1)
z<-pseudodata$z
sigma<-sqrt(pseudodata$sigma2)



