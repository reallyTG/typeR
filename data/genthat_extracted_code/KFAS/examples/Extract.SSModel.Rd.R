library(KFAS)


### Name: [<-.SSModel
### Title: Extract or Replace Parts of a State Space Model
### Aliases: [<-.SSModel [.SSModel

### ** Examples

set.seed(1)
model <- SSModel(rnorm(10) ~ 1)
model["H"]
model["H"] <- 10
# H is still an array:
model["H"]
logLik(model)
model$H <- 1
# model["H"] throws an error as H is now scalar:
model$H
logLik(model, check.model = TRUE) #with check.model = FALSE R crashes!



