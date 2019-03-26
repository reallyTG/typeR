library(generalhoslem)


### Name: logitgof
### Title: Hosmer-Lemeshow Tests for Logistic Regression Models
### Aliases: logitgof
### Keywords: regression

### ** Examples

### The mtcars dataset is a terrible example to use due to its small
### size - some of the models will return warnings as a result.
## Binary model
# 1/0 coding
data(mtcars)
mod1 <- glm(vs ~ cyl + mpg, data = mtcars, family = binomial)
logitgof(mtcars$vs, fitted(mod1))

# factor name coding
mtcars$engine <- factor(ifelse(mtcars$vs==0, "V", "S"), levels = c("V", "S"))
mod2 <- glm(engine ~ cyl + mpg, data = mtcars, family = binomial)
logitgof(mtcars$engine, fitted(mod2))

## Multinomial model
# with nnet
library(nnet)
mod3 <- multinom(gear ~ mpg + cyl, data = mtcars)
logitgof(mtcars$gear, fitted(mod3))

# with mlogit
library(mlogit)
data("Fishing", package = "mlogit")
Fish <- mlogit.data(Fishing, varying = c(2:9), shape = "wide", choice = "mode")
mod4 <- mlogit(mode ~ 0 | income, data = Fish)
logitgof(Fishing$mode, fitted(mod4, outcome = FALSE))

## Ordinal model
# polr in package MASS
mod5 <- polr(as.factor(gear) ~ mpg + cyl, data = mtcars)
logitgof(mtcars$gear, fitted(mod5), g = 5, ord = TRUE)

# clm in package ordinal
library(ordinal)
mtcars$gear <- as.factor(mtcars$gear)
mod6 <- clm(gear ~ mpg + cyl, data = mtcars)
predprob <- data.frame(mpg = mtcars$mpg, cyl = mtcars$cyl)
fv <- predict(mod6, newdata = predprob, type = "prob")$fit
logitgof(mtcars$gear, fv, g = 5, ord = TRUE)



