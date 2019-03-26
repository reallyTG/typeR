library(aurelius)


### Name: pfa.randomForest
### Title: PFA Formatting of Fitted Random Forest Models
### Aliases: pfa.randomForest

### ** Examples

dat <- data.frame(X1 = runif(100), 
                  X2 = rnorm(100))
dat$Y <- factor((rexp(100,5) + 5 * dat$X1 - 4 * dat$X2) > 0)

model <- randomForest::randomForest(Y ~ X1 + X2, data=dat, ntree=10)
model_as_pfa <- pfa(model)



