library(SIS)


### Name: predict.SIS
### Title: Model prediction based on a fitted SIS object.
### Aliases: predict.SIS
### Keywords: models

### ** Examples



set.seed(0)
n = 400; p = 50; rho = 0.5
corrmat = diag(rep(1-rho, p)) + matrix(rho, p, p)
corrmat[,4] = sqrt(rho)
corrmat[4, ] = sqrt(rho)
corrmat[4,4] = 1
corrmat[,5] = 0
corrmat[5, ] = 0
corrmat[5,5] = 1
cholmat = chol(corrmat)
x = matrix(rnorm(n*p, mean=0, sd=1), n, p)
x = x%*%cholmat
testX = matrix(rnorm(10*p, mean=0, sd=1), nrow=10, ncol=p)

# gaussian response 
set.seed(1)
b = c(4,4,4,-6*sqrt(2),4/3)
y=x[, 1:5]%*%b + rnorm(n)
model1=SIS(x, y, family='gaussian', tune='bic', varISIS='aggr', seed=11)

predict(model1, testX, type='response')
predict(model1, testX, which=1:10, type='response')

## Not run: 
##D # binary response 
##D set.seed(2)
##D feta = x[, 1:5]%*%b; fprob = exp(feta)/(1+exp(feta))
##D y = rbinom(n, 1, fprob)
##D model2=SIS(x, y, family='binomial', tune='bic', varISIS='aggr', seed=21)
##D 
##D predict(model2, testX, type='response')
##D predict(model2, testX, type='link')
##D predict(model2, testX, type='class')
##D 
##D predict(model2, testX, which=1:10, type='response')
##D predict(model2, testX, which=1:10, type='link')
##D predict(model2, testX, which=1:10, type='class')
##D 
##D # poisson response
##D set.seed(3)
##D b = c(0.6,0.6,0.6,-0.9*sqrt(2))
##D myrates = exp(x[, 1:4]%*%b)
##D y = rpois(n, myrates)
##D model3=SIS(x, y, family='poisson', penalty = 'lasso',tune='bic', varISIS='aggr', seed=31)
##D 
##D predict(model3, testX, type='response')
##D predict(model3, testX, type='link')
## End(Not run)






