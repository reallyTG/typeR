library(relimp)


### Name: relimp
### Title: Relative Importance of Predictors in a Regression Model
### Aliases: relimp print.relimp
### Keywords: models regression

### ** Examples

set.seed(182)  ## an arbitrary number, just for reproducibility
x <- rnorm(100)
z <- rnorm(100)
w <- rnorm(100)
y <- 3 + (2 * x) + z + w + rnorm(100)
test <- lm(y ~ x + z + w)
print(test)
relimp(test, 2, 3)    #  compares effects of x and z
relimp(test, 2, 3:4)  #  compares effect of x with that of (z,w) combined
##
##  Data on housing and satisfaction, from Venables and Ripley
##  -- multinomial logit model
library(MASS)
library(nnet)
data(housing)
house.mult <- multinom(Sat ~ Infl + Type + Cont, weights = Freq,
  data = housing)
relimp(house.mult, set1 = 2:3, set2 = 7, response.cat = "High")



