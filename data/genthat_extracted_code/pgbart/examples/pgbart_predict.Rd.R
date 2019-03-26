library(pgbart)


### Name: pgbart_predict
### Title: Make Predictions Using Bayesian Additive Regression Trees
### Aliases: pgbart_predict
### Keywords: nonparametric tree regression nonlinear

### ** Examples

##Example 1: simulated continuous outcome data (example from section 4.3 of Friedman's MARS paper)
f = function(x){
    10*sin(pi*x[,1]*x[,2]) + 20*(x[,3]-.5)^2+10*x[,4]+5*x[,5]
}
sigma = 1.0  #y = f(x) + sigma*z , z~N(0,1)
n = 100      #number of observations
set.seed(99)
x = matrix(runif(n*10), n, 10) 
Ey = f(x)
y = Ey+sigma*rnorm(n)
model_path = file.path(tempdir(),'pgbart.model')
pgbartFit = pgbart_train(x[1:(n*.75),], y[1:(n*.75)], 
                         model=model_path,
                         ndpost=200, ntree=5, usepg=TRUE)

pgbartPredict = pgbart_predict(x[(n*.75+1):n,], model=model_path)

cor(pgbartPredict$yhat.test.mean, y[(n*.75+1):n])

##Example 2: simulated binary outcome data (two normal example from Breiman) 
f <- function (n, d = 20) 
{
  x <- matrix(0, nrow = n, ncol = d)
  c1 <- sample.int(n, n/2)
  c2 <- (1:n)[-c1]
  a <- 2/sqrt(d)
  x[c1, ] <- matrix(rnorm(n = d * length(c1), mean = -a), ncol = d)
  x[c2, ] <- matrix(rnorm(n = d * length(c2), mean = a), ncol = d)
  
  x.train <- x
  y.train <- rep(0, n)
  y.train[c2] <- 1
  list(x.train=x.train, y.train=as.factor(y.train))
}


set.seed(99)
n <- 200
train <- f(n)
model_path = file.path(tempdir(),'pgbart.model')
pgbartFit = pgbart_train(train$x.train[1:(n*.75),], train$y.train[1:(n*.75)], 
                         model=model_path, ndpost=200, ntree=5, usepg=TRUE)
pgbartPredict = pgbart_predict(train$x.train[(n*.75+1):n,], model=model_path)
class.pred = ifelse(colMeans(apply(pgbartPredict$yhat.test, 2, pnorm)) <= 0.5, 0, 1)
table(class.pred, train$y.train[(n*.75+1):n])



