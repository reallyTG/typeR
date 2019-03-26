library(emil)


### Name: get_tuning
### Title: Extract parameter tuning statistics
### Aliases: get_tuning

### ** Examples

procedure <- modeling_procedure("randomForest",
    parameter = list(mtry = c(1, 3),
                     nodesize = c(4, 10)))
model <- fit(procedure, x=iris[-5], y=iris$Species)
get_tuning(model)

options(emil_max_indent=4)
ho <- resample("holdout", iris$Species, nfold=5)
result <- evaluate(procedure, iris[-5], iris$Species, resample=ho,
                   .save=c(model=TRUE))
get_tuning(result)



