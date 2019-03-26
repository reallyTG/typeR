library(mixlm)


### Name: forward
### Title: F-test based model effect selection for linear models.
### Aliases: forward wideForward print.WF backward stepWise stepWiseBack
### Keywords: regression

### ** Examples

set.seed(0)
data <- data.frame(y = rnorm(8),
				   x = factor(c('a','a','a','a','b','b','b','b')),
				   z = factor(c('a','a','b','b','a','a','b','b')))
mod <- lm(y ~ x + z, data=data)
forward(mod)
backward(mod)
stepWise(mod)
stepWiseBack(mod)

# Forward selection for wide matrices (large number of predictors)
set.seed(0)
mydata <- data.frame(y = rnorm(6), X = matrix(rnorm(60),6,10))
fs <- wideForward(y ~ ., mydata)
print(fs)




