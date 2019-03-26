library(bootStepAIC)


### Name: boot.stepAIC
### Title: Bootstraps the Stepwise Algorithm of stepAIC() for Choosing a
###   Model by AIC
### Aliases: boot.stepAIC
### Keywords: regression

### ** Examples


## lm() Example ##
n <- 350
x1 <- runif(n, -4, 4)
x2 <- runif(n, -4, 4)
x3 <- runif(n, -4, 4)
x4 <- runif(n, -4, 4)
x5 <- runif(n, -4, 4)
x6 <- runif(n, -4, 4)
x7 <- factor(sample(letters[1:3], n, rep = TRUE))
y <- 5 + 3 * x1 + 2 * x2 - 1.5 * x3 - 0.8 * x4 + rnorm(n, sd = 2.5)
data <- data.frame(y, x1, x2, x3, x4, x5, x6, x7)
rm(n, x1, x2, x3, x4, x5, x6, x7, y)

lmFit <- lm(y ~ (. - x7) * x7, data = data)
boot.stepAIC(lmFit, data)

#####################################################################

## glm() Example ##
n <- 200
x1 <- runif(n, -3, 3)
x2 <- runif(n, -3, 3)
x3 <- runif(n, -3, 3)
x4 <- runif(n, -3, 3)
x5 <- factor(sample(letters[1:2], n, rep = TRUE))
eta <- 0.1 + 1.6 * x1 - 2.5 * as.numeric(as.character(x5) == levels(x5)[1])
y1 <- rbinom(n, 1, plogis(eta))
y2 <- rbinom(n, 1, 0.6)
data <- data.frame(y1, y2, x1, x2, x3, x4, x5)
rm(n, x1, x2, x3, x4, x5, eta, y1, y2)

glmFit1 <- glm(y1 ~ x1 + x2 + x3 + x4 + x5, family = binomial, data = data)
glmFit2 <- glm(y2 ~ x1 + x2 + x3 + x4 + x5, family = binomial, data = data)

boot.stepAIC(glmFit1, data, B = 50)
boot.stepAIC(glmFit2, data, B = 50)




