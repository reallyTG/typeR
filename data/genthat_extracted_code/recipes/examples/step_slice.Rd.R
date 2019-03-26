library(recipes)


### Name: step_slice
### Title: Filter rows by position using dplyr
### Aliases: step_slice tidy.step_slice
### Keywords: datagen

### ** Examples

rec <- recipe( ~ ., data = iris) %>%
  step_slice(1:3)

prepped <- prep(rec, training = iris %>% slice(1:75), retain = TRUE)
tidy(prepped, number = 1)

library(dplyr)

dplyr_train <-
  iris %>%
  as_tibble() %>%
  slice(1:75) %>%
  slice(1:3)

rec_train <- juice(prepped)
all.equal(dplyr_train, rec_train)

dplyr_test <-
  iris %>%
  as_tibble() %>%
  slice(76:150) %>%
  slice(1:3)
rec_test <- bake(prepped, iris %>% slice(76:150))
all.equal(dplyr_test, rec_test)

# Embedding the integer expression (or vector) into the
# recipe:

keep_rows <- 1:6

qq_rec <-
  recipe( ~ ., data = iris) %>%
  # Embed `keep_rows` in the call using !!
  step_slice(!!keep_rows) %>%
  prep(training = iris)

tidy(qq_rec, number = 1)



