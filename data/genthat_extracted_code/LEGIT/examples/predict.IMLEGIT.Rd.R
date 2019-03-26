library(LEGIT)


### Name: predict.IMLEGIT
### Title: Predictions of IMLEGIT fits
### Aliases: predict.IMLEGIT

### ** Examples

train = example_2way(250, 1, seed=777)
test = example_2way(100, 1, seed=666)
fit = IMLEGIT(train$data, list(G=train$G, E=train$E), y ~ G*E)
ssres = sum((test$data$y - predict(fit, test$data, list(G=test$G, E=test$E)))^2)
sstotal = sum((test$data$y - mean(test$data$y))^2)
R2 = 1 - ssres/sstotal
R2



