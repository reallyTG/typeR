library(RLT)


### Name: predict.RLT
### Title: Prediction function for reinforcement learning trees
### Aliases: predict.RLT

### ** Examples

x = matrix(rnorm(100), ncol = 10)
y = rowMeans(x)
fit = RLT(x, y, ntrees = 5)
predict(fit, x)



