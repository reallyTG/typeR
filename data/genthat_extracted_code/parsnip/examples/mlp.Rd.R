library(parsnip)


### Name: mlp
### Title: General Interface for Single Layer Neural Network
### Aliases: mlp update.mlp

### ** Examples

mlp(mode = "classification", penalty = 0.01)
# Parameters can be represented by a placeholder:
mlp(mode = "regression", hidden_units = varying())
model <- mlp(hidden_units = 10, dropout = 0.30)
model
update(model, hidden_units = 2)
update(model, hidden_units = 2, fresh = TRUE)



