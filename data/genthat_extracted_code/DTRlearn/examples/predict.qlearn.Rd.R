library(DTRlearn)


### Name: predict.qlearn
### Title: Predict optimal treatment by Qlearning
### Aliases: predict.qlearn

### ** Examples

n=200
A=2*rbinom(n,1,0.5)-1
p=10
mu=numeric(p)
Sigma=diag(p)
X=mvrnorm(n,mu,Sigma)
R=X[,1:3]%*%c(1,1,-2)+X[,3:5]%*%c(1,1,-2)*A+rnorm(n)

model1=Qlearning_Single(X,A,R)
m=100
Xtest=mvrnorm(m,mu,Sigma)
predict(model1,Xtest)



