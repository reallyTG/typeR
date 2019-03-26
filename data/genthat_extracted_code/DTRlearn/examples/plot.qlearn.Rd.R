library(DTRlearn)


### Name: plot.qlearn
### Title: Plot the linear coefficients of interaction
### Aliases: plot.qlearn

### ** Examples

n=200
A=2*rbinom(n,1,0.5)-1
p=20
mu=numeric(p)
Sigma=diag(p)
X=mvrnorm(n,mu,Sigma)
R=X[,1:3]%*%c(1,1,-2)+X[,3:5]%*%c(1,1,-2)*A+rnorm(n)
modelQ=Qlearning_Single(X,A,R)
plot(modelQ)



