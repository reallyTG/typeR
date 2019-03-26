library(recipes)


### Name: step_shuffle
### Title: Shuffle Variables
### Aliases: step_shuffle tidy.step_shuffle
### Keywords: datagen

### ** Examples

integers <- data.frame(A = 1:12, B = 13:24, C = 25:36)

library(dplyr)
rec <- recipe(~ A + B + C, data = integers) %>%
  step_shuffle(A, B)

rand_set <- prep(rec, training = integers)

set.seed(5377)
bake(rand_set, integers)

tidy(rec, number = 1)
tidy(rand_set, number = 1)



