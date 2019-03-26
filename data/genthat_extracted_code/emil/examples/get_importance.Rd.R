library(emil)


### Name: get_importance
### Title: Feature (variable) importance of a fitted model
### Aliases: get_importance

### ** Examples

procedure <- modeling_procedure("pamr")
model <- fit("pamr", x=iris[-5], y=iris$Species)
get_importance(model)

cv <- resample("crossvalidation", iris$Species, nrepeat=2, nfold=3)
result <- evaluate("pamr", iris[-5], iris$Species, resample=cv,
                   .save=c(importance=TRUE))
get_importance(result)



