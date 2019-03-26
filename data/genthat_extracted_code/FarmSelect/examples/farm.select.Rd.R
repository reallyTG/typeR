library(FarmSelect)


### Name: farm.select
### Title: Factor-adjusted robust model selection
### Aliases: farm.select

### ** Examples

##linear regression
set.seed(100)
P = 200 #dimension
N = 50 #samples
K = 3 #nfactors
Q = 3 #model size
Lambda = matrix(rnorm(P*K, 0,1), P,K)
F = matrix(rnorm(N*K, 0,1), N,K)
U = matrix(rnorm(P*N, 0,1), P,N)
X = Lambda%*%t(F)+U
X = t(X)
beta_1 = rep(5,Q)
beta = c(beta_1, rep(0,P-Q))
eps = rt(N, 2.5)
Y = X%*%beta+eps

##with default options
output = farm.select(X,Y) #robust, no cross-validation
output$beta.chosen #variables selected
output$coef.chosen #coefficients of selected variables

#examples of other robustification options
output = farm.select(X,Y,robust = FALSE) #non-robust
output = farm.select(X,Y, tau = 3) #robust, no cross-validation, specified tau
#output = farm.select(X,Y, cv= TRUE) #robust, cross-validation: LONG RUNNING!

##changing the loss function and inputting factors
output = farm.select(X, Y,loss = "mcp", K.factors = 4)

##use a logistic regression model, a larger sample size is desired.
## Not run: 
##D set.seed(100)
##D P = 400 #dimension
##D N = 300 #samples
##D K = 3 #nfactors
##D Q = 3 #model size
##D Lambda = matrix(rnorm(P*K, 0,1), P,K)
##D F = matrix(rnorm(N*K, 0,1), N,K)
##D U = matrix(rnorm(P*N, 0,1), P,N)
##D X = Lambda%*%t(F)+U
##D X = t(X)
##D beta_1 = rep(5, Q)
##D beta = c(beta_1, rep(0,P-Q))
##D eps = rnorm(N)
##D Prob = 1/(1+exp(-X%*%beta))
##D Y = rbinom(N, 1, Prob)
##D 
##D output = farm.select(X,Y, lin.reg=FALSE, eps=1e-3)
##D output$beta.chosen
##D output$coef.chosen
## End(Not run)



