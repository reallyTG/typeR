library(MachineShop)


### Name: dependence
### Title: Partial Dependence
### Aliases: dependence

### ** Examples

gbmfit <- fit(Species ~ ., data = iris, model = GBMModel)
(pd <- dependence(gbmfit, select = c(Petal.Length, Petal.Width)))
plot(pd)




