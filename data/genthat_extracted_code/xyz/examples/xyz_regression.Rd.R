library(xyz)


### Name: xyz_regression
### Title: Elasticnet with interactions (glmnet)
### Aliases: xyz_regression

### ** Examples

n<-300
p<-1000
#build matrix of predictors
X<-matrix(rnorm(n*p),n,p)
#build a main effect and an interaction into Y
Y<-4*X[,1]*X[,2]-5*X[,4]+rnorm(n)
result<-xyz_regression(X,Y,n_lambda=10,alpha=0.9,L=10)
#print the result
print(result)
#plot the result
plot(result)



