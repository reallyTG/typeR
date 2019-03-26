library(parsnip)


### Name: rand_forest
### Title: General Interface for Random Forest Models
### Aliases: rand_forest update.rand_forest

### ** Examples

rand_forest(mode = "classification", trees = 2000)
# Parameters can be represented by a placeholder:
rand_forest(mode = "regression", mtry = varying())
model <- rand_forest(mtry = 10, min_n = 3)
model
update(model, mtry = 1)
update(model, mtry = 1, fresh = TRUE)



