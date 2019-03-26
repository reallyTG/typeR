library(Libra)


### Name: lb
### Title: Linearized Bregman solver for linear, binomial, multinomial
###   models with lasso, group lasso or column lasso penalty.
### Aliases: lb
### Keywords: regression

### ** Examples

#Examples in the reference paper
library(MASS)
n = 80;p = 100;k = 30;sigma = 1
Sigma = 1/(3*p)*matrix(rep(1,p^2),p,p)
diag(Sigma) = 1
A = mvrnorm(n, rep(0, p), Sigma)
u_ref = rep(0,p)
supp_ref = 1:k
u_ref[supp_ref] = rnorm(k)
u_ref[supp_ref] = u_ref[supp_ref]+sign(u_ref[supp_ref])
b = as.vector(A%*%u_ref + sigma*rnorm(n))
kappa = 16
alpha = 1/160
object <- lb(A,b,kappa,alpha,family="gaussian",group=FALSE,
             trate=20,intercept=FALSE,normalize=FALSE)
plot(object,xlim=c(0,3),main=bquote(paste("LB ",kappa,"=",.(kappa))))


#Diabetes, linear case
library(Libra)
data(diabetes)
attach(diabetes)
object <- lb(x,y,100,1e-3,family="gaussian",group=FALSE)
plot(object)
detach(diabetes)

#Simulated data, binomial case
data('west10')
y<-2*west10[,1]-1;
X<-as.matrix(2*west10[,2:10]-1);
path <- lb(X,y,kappa = 1,family="binomial",trate=100,normalize = FALSE)
plot(path,xtype="norm",omit.zeros=FALSE)

#Simulated data, multinomial case
X <- matrix(rnorm(500*100), nrow=500, ncol=100)
alpha <- matrix(c(rnorm(30*3), rep(0,70*3)),nrow=3)
P <- exp(alpha%*%t(X))
P <- scale(P,FALSE,apply(P,2,sum))
y <- rep(0,500)
rd <- runif(500)
y[rd<P[1,]] <- 1
y[rd>1-P[3,]] <- -1
result <- lb(X,y,kappa=5,alpha=0.1,family="multinomial",
 group=TRUE,intercept=FALSE,normalize = FALSE)
plot(result)




