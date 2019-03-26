library(rlmDataDriven)


### Name: rlmDD
### Title: Data driven robust methods
### Aliases: rlmDD
### Keywords: regression

### ** Examples


library(MASS)
data(stackloss)

LS <- lm(stack.loss ~ stack.x)
RB <- rlm(stack.loss ~ stack.x, psi = psi.huber, k = 1.345)
DD1 <- rlmDD(stack.loss, stack.x, LS$coef, RB$coef, method = "Huber", plot = "Y")

LS <- lm(stack.loss ~ stack.x)
RB <- rlm(stack.loss ~ stack.x, psi = psi.bisquare, c = 4.685)
DD2 <- rlmDD(stack.loss, stack.x, LS$coef, RB$coef, method = "Bisquare", plot = "Y")

LS <- lm(stack.loss ~ stack.x)
RB <- rlm(stack.loss ~ stack.x, psi = psi.huber, k = 1.345)
DD3 <- rlmDD(stack.loss, stack.x, LS$coef, RB$coef, method = "Exponential", plot = "Y")


## Plasma dataset


data(plasma)

y <- plasma$y
x <- cbind(plasma$calories, plasma$dietary)

LS <- lm(y ~ x)
RB <- rlm(y ~ x, psi = psi.huber, k = 1.345)
DD.h <- rlmDD(y, x, LS$coef, RB$coef, method = "Huber", plot = "Y")

LS <- lm(y ~ x)
RB <- rlm(y ~ x, psi = psi.bisquare, c = 4.685)
DD.b <- rlmDD(y, x, LS$coef, RB$coef, method = "Bisquare", plot = "Y")

LS <- lm(y ~ x)
RB <- rlm(y ~ x, psi = psi.huber, k = 1.345)
DD.e <- rlmDD(y, x, LS$coef, RB$coef, method = "Exponential", plot = "Y")





