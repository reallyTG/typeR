library(MachineShop)


### Name: C50Model
### Title: C5.0 Decision Trees and Rule-Based Model
### Aliases: C50Model

### ** Examples

modelfit <- fit(Species ~ ., data = iris, model = C50Model())
varimp(modelfit, metric = "splits", scale = FALSE)




