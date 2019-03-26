library(betaboost)


### Name: R2.betaboost
### Title: Computing pseudo R^2 for betaboost models.
### Aliases: LH.betaboost R2.betaboost

### ** Examples


# simple simulated example
require(gamlss.dist)
set.seed(1234)
x1 <- rnorm(100)
x2 <- rnorm(100)
x3 <- rnorm(100)
x4 <- rnorm(100)
y <- rBE(n = 100, mu = plogis(x1 +x2),
         sigma = plogis(x3 + x4))
data <- data.frame(y ,x1, x2, x3, x4)
data <- data[!data$y%in%c(0,1),]
rm(x1,x2,x3,x4,y)

b1 <- betaboost(formula = y ~ x1 + x2, 
                phi.formula = y ~ x3 + x4, 
                data = data, form.type = "classic",
                iterations = 120)
R2.betaboost(b1, data = data)




