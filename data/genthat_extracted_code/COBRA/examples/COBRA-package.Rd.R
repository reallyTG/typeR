library(COBRA)


### Name: COBRA-package
### Title: Nonlinear Aggregation of Predictors
### Aliases: COBRA-package
### Keywords: package

### ** Examples

n <- 500
d <- 30
ntrain <- 400
X <- replicate(d,2*runif(n = n)-1)
Y <- X[,1]^2 + X[,3]^3 + exp(X[,10]) + rnorm(n = n, sd = .1)
train.design <- as.matrix(X[1:ntrain,])
train.responses <- Y[1:ntrain]
test <- as.matrix(X[-(1:ntrain),])
test.responses <- Y[-(1:ntrain)]

## using the default machines
if(require(lars) && require(tree) && require(ridge) &&
require(randomForest))
{
res <- COBRA(train.design = train.design,
             train.responses = train.responses,
             test = test)

print(cbind(res$predict,test.responses))
plot(test.responses,res$predict,xlab="Responses",ylab="Predictions",pch=3,col=2)
abline(0,1,lty=2)
}

## using own machines
machines.names <- c("Soothsayer","Dummy")
machines <- matrix(nr = n, nc = 2, data = 0)
machines[,1] <- Y+rnorm(n = n, sd=.1)          ## soothsayer
machines[,2] <- mean(train.responses)          ## dummy prediction, averaging train.responses

res2 <- COBRA(train.design = train.design,
              train.responses = train.responses,
              test = test,
              machines = machines,
              machines.names = machines.names)

print(cbind(res2$predict,test.responses))
plot(test.responses,res2$predict,xlab="Responses",ylab="Predictions",pch=3,col=2)
abline(0,1,lty=2)





