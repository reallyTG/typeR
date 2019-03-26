library(pgbart)


### Name: pgbart_train
### Title: Train Bayesian Additive Regression Trees Using PG Sampler or
###   Gibbs/NH Sampler
### Aliases: pgbart_train plot.pgbart
### Keywords: nonparametric tree regression nonlinear

### ** Examples

##Example 1: simulated continuous outcome data (example from section 4.3 of Friedman's MARS paper)
f = function(x){
    10*sin(pi*x[,1]*x[,2]) + 20*(x[,3]-.5)^2+10*x[,4]+5*x[,5]
}
sigma = 1.0  #y = f(x) + sigma*z , z~N(0,1)
n = 100      #number of observations
set.seed(99)
x = matrix(runif(n*10),n,10) #10 variables, only first 5 matter
Ey = f(x)
y = Ey+sigma*rnorm(n)
lmFit = lm(y~.,data.frame(x,y)) #compare lm fit to pgbart later
##run pgBART
set.seed(99)
model_path = file.path(tempdir(),'pgbart.model')
pgbartFit = pgbart_train(x, y, model=model_path,ndpost=200, ntree=5, usepg=TRUE)
plot(pgbartFit) # plot pgbart fit
##compare pgbart fit to linear matter and truth = Ey
fitmat = cbind(y,Ey,lmFit$fitted,pgbartFit$yhat.train.mean)
colnames(fitmat) = c('y','Ey','lm','pgbart')
print(cor(fitmat))

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

#
set.seed(99)
train <- f(200)
model_path = file.path(tempdir(),'pgbart.model')
pgbartFit = pgbart_train(train$x.train, train$y.train, 
                        model=model_path,
                        ndpost=200, ntree=5, usepg=TRUE)
class.pred = ifelse(colMeans(apply(pgbartFit$yhat.train, 2, pnorm)) <= 0.5, 0, 1)
table(class.pred, train$y.train)



