library(rsample)


### Name: as.data.frame.rsplit
### Title: Convert an 'rsplit' object to a data frame
### Aliases: as.data.frame.rsplit analysis assessment

### ** Examples

library(dplyr)
set.seed(104)
folds <- vfold_cv(mtcars)

model_data_1 <- folds$splits[[1]] %>% analysis()
holdout_data_1 <- folds$splits[[1]] %>% assessment()



