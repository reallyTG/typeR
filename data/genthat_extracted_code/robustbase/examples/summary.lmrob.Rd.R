library(robustbase)


### Name: summary.lmrob
### Title: Summary Method for "lmrob" Objects
### Aliases: summary.lmrob hatvalues.lmrob .lmrob.hat vcov.lmrob
###   print.summary.lmrob model.matrix.lmrob
### Keywords: robust regression

### ** Examples

mod1 <- lmrob(stack.loss ~ ., data = stackloss)
sa <- summary(mod1)  # calls summary.lmrob(....)
sa                   # dispatches to call print.summary.lmrob(....)

## correlation between estimated coefficients:
cov2cor(vcov(mod1))

cbind(fit = fitted(mod1), resid = residuals(mod1),
      wgts= weights(mod1, type="robustness"),
      predict(mod1, interval="prediction"))

data(heart)
sm2 <- summary( m2 <- lmrob(clength ~ ., data = heart) )
sm2



