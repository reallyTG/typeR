library(mpbart)


### Name: rmpbart
### Title: Multinomial Probit Bayesian Additive Regression Trees
### Aliases: rmpbart

### ** Examples


set.seed(64)
library(mpbart)
p=3
train_wave = mlbench.waveform(50)
test_wave = mlbench.waveform(100)
traindata = data.frame(train_wave$x, y = train_wave$classes) 
testdata = data.frame(test_wave$x, y = test_wave$classes)

x.train = data.frame(train_wave$x)
x.test = data.frame(test_wave$x)

y.train = train_wave$classes

sigma0 = diag(p-1)
burn = 100
ndraws = 200 # a higher number >=1000 is more appropriate.

Mcmc1=list(sigma0=sigma0, burn = burn, ndraws = ndraws)
Prior1 = list(nu=p+2,
              V=(p+2)*diag(p-1),
              ntrees = 5, #typically 200 trees is good 
              kfac = 2.0, 
              pbd = 1.0, 
              pb = 0.5, 
              alpha = 0.99,  
              beta =  2.0, 
              nc = 200, 
              priorindep = FALSE)



out = rmpbart(x.train = x.train, y.train = y.train, x.test = x.test, 
            Prior = Prior1, Mcmc=Mcmc1, seedvalue = 99)

#confusion matrix train
table(y.train, out$predicted_class_train)
table(y.train==out$predicted_class_train)/sum(table(y.train==out$predicted_class_train))
  

#confusion matrix test
table(test_wave$classes, out$predicted_class_test)

test_err <- sum(test_wave$classes != out$predicted_class_test)/
    sum(table(test_wave$classes == out$predicted_class_test))

cat("test error :", test_err )



