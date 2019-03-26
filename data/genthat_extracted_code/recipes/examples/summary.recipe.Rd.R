library(recipes)


### Name: summary.recipe
### Title: Summarize a Recipe
### Aliases: summary.recipe

### ** Examples

rec <- recipe( ~ ., data = USArrests)
summary(rec)
rec <- step_pca(rec, all_numeric(), num = 3)
summary(rec) # still the same since not yet trained
rec <- prep(rec, training = USArrests)
summary(rec)



