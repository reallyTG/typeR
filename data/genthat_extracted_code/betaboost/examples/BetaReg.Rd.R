library(betaboost)


### Name: BetaReg
### Title: BetaReg family for boosting beta regression
### Aliases: BetaReg

### ** Examples

require(gamlss.dist)
# simple simulated example
set.seed(1234)
x1 <- rnorm(100)
x2 <- rnorm(100)
x3 <- rnorm(100)
x4 <- rnorm(100)
y <- rBE(n = 100, mu = plogis(x1 + x2),
                  sigma = plogis(x3 + x4))
data <- data.frame(y ,x1, x2, x3, x4)
data <- data[!data$y %in% c(0,1),]

# 'classic' beta regression
b1 <- betaboost(formula = y ~ x1 + x2, data = data,
                iterations = 120)
coef(b1)

# compare to mboost
b2 <- glmboost(y ~ x1  + x2, data = data, family = BetaReg())
coef(b2)

# different values due to different defaults for step length and mstop


# same model with mboost
b3 <- glmboost(y ~ x1  + x2, data = data, family = BetaReg(), 
               control = boost_control(mstop = 120, nu = 0.01))
coef(b3)
coef(b1)




