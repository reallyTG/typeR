library(MachineShop)


### Name: lift
### Title: Model Lift
### Aliases: lift Lift

### ** Examples

library(MASS)

res <- resample(type ~ ., data = Pima.tr, model = GBMModel)
(lf <- lift(res))
plot(lf)




