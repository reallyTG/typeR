library(DTRlearn)


### Name: predict.linearcl
### Title: Predict
### Aliases: predict.linearcl

### ** Examples

n=200
A=2*rbinom(n,1,0.5)-1
p=20
mu=numeric(p)
Sigma=diag(p)
#feature variable is multi variate normal
X=mvrnorm(n,mu,Sigma)
#the outcome is generated where the true optimal treatment
#is sign of the interaction term(of treatment and feature)
R=X[,1:3]%*%c(1,1,-2)+X[,3:5]%*%c(1,1,-2)*A+rnorm(n)

# linear SVM
model1=wsvm(X,A,R)
m=100
Xtest=mvrnorm(m,mu,Sigma)
predict(model1,Xtest)



