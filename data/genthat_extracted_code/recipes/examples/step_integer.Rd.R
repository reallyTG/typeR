library(recipes)


### Name: step_integer
### Title: Convert values to predefined integers
### Aliases: step_integer tidy.step_integer
### Keywords: datagen

### ** Examples

data(okc)

okc$location <- factor(okc$location)

okc_tr <- okc[1:100, ]
okc_tr$age[1] <- NA

okc_te <- okc[101:105, ]
okc_te$age[1] <- NA
okc_te$diet[1] <- "fast food"
okc_te$diet[2] <- NA

rec <- recipe(Class ~ ., data = okc_tr) %>%
  step_integer(all_predictors()) %>%
  prep(training = okc_tr, retain = TRUE)

bake(rec, okc_te, all_predictors())
tidy(rec, number = 1)



