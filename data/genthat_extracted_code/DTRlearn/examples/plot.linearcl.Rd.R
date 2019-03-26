library(DTRlearn)


### Name: plot.linearcl
### Title: Plot coefficients for SVM with linear kernel
### Aliases: plot.linearcl

### ** Examples

n=200
A=2*rbinom(n,1,0.5)-1
p=20
mu=numeric(p)
Sigma=diag(p)
X=mvrnorm(n,mu,Sigma)
R=X[,1:3]%*%c(1,1,-2)+X[,3:5]%*%c(1,1,-2)*A+rnorm(n)
model1=Olearning_Single(X,A,R)
plot(model1)



