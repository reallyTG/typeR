library(ELMR)


### Name: OSelm_training
### Title: Trains an online sequential extreme learning machine with random
###   weights
### Aliases: OSelm_training

### ** Examples

x = runif(100, 0, 50)
y = sqrt(x)
train = data.frame(y,x)
train = data.frame(preProcess(train))
OSelm_train.formula(y~x, train, "regression", 100, "hardlim", 10, 10)



