library(recipes)


### Name: step_other
### Title: Collapse Some Categorical Levels
### Aliases: step_other tidy.step_other
### Keywords: datagen

### ** Examples

data(okc)

set.seed(19)
in_train <- sample(1:nrow(okc), size = 30000)

okc_tr <- okc[ in_train,]
okc_te <- okc[-in_train,]

rec <- recipe(~ diet + location, data = okc_tr)


rec <- rec %>%
  step_other(diet, location, threshold = .1, other = "other values")
rec <- prep(rec, training = okc_tr)

collapsed <- bake(rec, okc_te)
table(okc_te$diet, collapsed$diet, useNA = "always")

tidy(rec, number = 1)

# novel levels are also "othered"
tahiti <- okc[1,]
tahiti$location <- "a magical place"
bake(rec, tahiti)



