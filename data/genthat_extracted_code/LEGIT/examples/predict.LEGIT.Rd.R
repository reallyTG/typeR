library(LEGIT)


### Name: predict.LEGIT
### Title: Predictions of LEGIT fits
### Aliases: predict.LEGIT

### ** Examples

train = example_2way(250, 1, seed=777)
test = example_2way(100, 1, seed=666)
fit = LEGIT(train$data, train$G, train$E, y ~ G*E)
ssres = sum((test$data$y - predict(fit, test$data, test$G, test$E))^2)
sstotal = sum((test$data$y - mean(test$data$y))^2)
R2 = 1 - ssres/sstotal



