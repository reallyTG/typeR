library(DTRlearn)


### Name: wsvm
### Title: weighted SVM
### Aliases: wsvm

### ** Examples

#generating random asigned treatment vector A
n=200
A=2*rbinom(n,1,0.5)-1
p=20
mu=numeric(p)
Sigma=diag(p)
#feature variable is multivariate normal distributed
X=mvrnorm(n,mu,Sigma)
#the outcome is generated where the true optimal treatment 
#is sign of the interaction term(of treatment and feature)
R=X[,1:3]%*%c(1,1,-2)+X[,3:5]%*%c(1,1,-2)*A+rnorm(n)

# linear SVM
model1=wsvm(X,A,R)
#Check the total number that agress with the true optimal treatment among n=200 patients
sum(sign(model1$fit)==sign(X[,3:5]%*%c(1,1,-2)))

# SVM with rbf kernel and sigma=0.05
model2=wsvm(X,A,R,'rbf',0.05)
#Check the total number that agress with the true optimal treatment among n=200 patients
sum(sign(model2$fit)==sign(X[,3:5]%*%c(1,1,-2)))



