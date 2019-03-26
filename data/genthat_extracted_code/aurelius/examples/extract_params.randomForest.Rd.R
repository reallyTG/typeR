library(aurelius)


### Name: extract_params.randomForest
### Title: extract_params.randomForest
### Aliases: extract_params.randomForest

### ** Examples

dat <- data.frame(X1 = runif(100), 
                  X2 = rnorm(100))
dat$Y <- factor((rexp(100,5) + 5 * dat$X1 - 4 * dat$X2) > 0)

model <- randomForest::randomForest(Y ~ X1 + X2, data=dat, ntree=10)
my_tree <- extract_params(model, 1)



