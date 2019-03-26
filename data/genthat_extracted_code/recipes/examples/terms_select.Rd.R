library(recipes)


### Name: terms_select
### Title: Select Terms in a Step Function.
### Aliases: terms_select
### Keywords: datagen

### ** Examples

library(rlang)
data(okc)
rec <- recipe(~ ., data = okc)
info <- summary(rec)
terms_select(info = info, quos(all_predictors()))



