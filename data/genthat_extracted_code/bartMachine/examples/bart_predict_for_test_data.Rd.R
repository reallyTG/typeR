library(bartMachine)


### Name: bart_predict_for_test_data
### Title: Predict for Test Data with Known Outcomes
### Aliases: bart_predict_for_test_data
### Keywords: ~kwd1 ~kwd2

### ** Examples

#generate Friedman data
set.seed(11)
n  = 250 
p = 5
X = data.frame(matrix(runif(n * p), ncol = p))
y = 10 * sin(pi* X[ ,1] * X[,2]) +20 * (X[,3] -.5)^2 + 10 * X[ ,4] + 5 * X[,5] + rnorm(n)

##split into train and test
train_X = X[1 : 200, ]
test_X = X[201 : 250, ]
train_y = y[1 : 200]
test_y = y[201 : 250]

##build BART regression model
bart_machine = bartMachine(train_X, train_y)

#explore performance on test data
oos_perf = bart_predict_for_test_data(bart_machine, test_X, test_y)
print(oos_perf$rmse)




