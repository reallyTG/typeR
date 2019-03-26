library(SIS)


### Name: tune.fit
### Title: Using the 'glmnet' and 'ncvreg' packages, fits a Generalized
###   Linear Model or Cox Proportional Hazards Model using various methods
###   for choosing the regularization parameter lambda
### Aliases: tune.fit
### Keywords: models

### ** Examples



set.seed(0)
data('leukemia.train', package = 'SIS')
y.train = leukemia.train[,dim(leukemia.train)[2]]
x.train = as.matrix(leukemia.train[,-dim(leukemia.train)[2]])
x.train = standardize(x.train)
model = tune.fit(x.train[,1:3500], y.train, family='binomial', tune='bic')
model$ix
model$a0
model$beta





