library(healthcareai)


### Name: split_train_test
### Title: Split data into training and test data frames
### Aliases: split_train_test

### ** Examples

split_train_test(mtcars, am, .9)


# Below is an additional example of grouping. Grouping is where individuals
# in the same group are in the same training/test set. Here we group on car
# owners. Owners will be in the same training/test set.
library(dplyr)

mtcars %>%
  mutate(owner = rep(letters[1:16], each = 2)) %>%
  split_train_test(., am, grouping_col = owner)




