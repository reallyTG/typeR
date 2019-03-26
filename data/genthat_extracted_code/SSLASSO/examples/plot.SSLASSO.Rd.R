library(SSLASSO)


### Name: plot.SSLASSO
### Title: Plot coefficients from a "SSLASSO" object
### Aliases: plot.SSLASSO
### Keywords: models regression

### ** Examples

	
## Linear regression, where p>n
library(SSLASSO)

n=100
p=1000
X=matrix(rnorm(n*p), n, p)
beta=c(1,2,3,rep(0,p-3))
Y=X[,1]*beta[1]+X[,2]*beta[2]+X[,3]*beta[3]+rnorm(n)
lambda1<-0.1
lambda0<-seq(lambda1,100,length=50)
theta<-0.5


# Separable penalty with fixed theta

result<-SSLASSO(X, Y,penalty="separable", variance = "fixed", 
lambda1 = lambda1, lambda0 = lambda0,theta=theta)

plot(result)




