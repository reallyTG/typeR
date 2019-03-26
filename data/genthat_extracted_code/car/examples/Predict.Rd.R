library(car)


### Name: Predict
### Title: Model Predictions
### Aliases: Predict Predict.lm
### Keywords: models

### ** Examples

mod <- lm(interlocks ~ log(assets), data=Ornstein)
newd <- data.frame(assets=exp(4:12))
(p1 <- predict(mod, newd, interval="prediction"))
p2 <- Predict(mod, newd, interval="prediction", vcov.=vcov)
all.equal(p1, p2) # the same

(predict(mod, newd, se=TRUE))
(p3 <- Predict(mod, newd, se=TRUE, vcov.=hccm)) # larger SEs
p4 <- Predict(mod, newd, se=TRUE, vcov.=hccm(mod, type="hc3"))
all.equal(p3, p4) # the same



