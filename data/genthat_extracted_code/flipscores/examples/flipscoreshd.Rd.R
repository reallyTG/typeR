library(flipscores)


### Name: flipscoreshd
### Title: Robust testing in GLMs
### Aliases: flipscoreshd

### ** Examples


set.seed(8193)
n <-50

dataset= data.frame(matrix(rnorm(n*5),n,5))
  
for(k in 1:n){
  dataset[k,1:5] <- dataset[k,1:5] + rnorm(1)   #make the covariates correlated
}

#Y has a negative binomial distribution but we assume a Poisson model:
#Y depends only on the 4-th covariate:
dataset$y <- rnbinom(n, mu = exp(dataset[,4]*0.5), size=1 )

#We will test the hypothesis H0 that X1,X2,X3 all have coefficient 0.
#So H0 is true. X4,X5 are nuisance covariates.

formula0 <- as.formula("y ~ X4+X5")           #X4,X5: nuisance 
X1 <- dataset[,1:3]                           #X1,X2,X3: tested

model0 = glm(formula0, family=poisson,na.action=na.omit,data=dataset,x=TRUE)

## Basic test (often conservative):
pv1 <- flipscoreshd(model0=model0, X1=X1, w=200, scoretype="basic",V="invinfo")
pv1  #p-value

## Test that takes into account nuisance estimation:
pv1 <- flipscoreshd(model0=model0, X1=X1, w=200, scoretype="effective",V="invinfo")
pv1  #p-value




