library(sjmisc)


### Name: merge_imputations
### Title: Merges multiple imputed data frames into a single data frame
### Aliases: merge_imputations

### ** Examples

library(mice)
imp <- mice(nhanes)

# return data frame with imputed variables
merge_imputations(nhanes, imp)

# append imputed variables to original data frame
merge_imputations(nhanes, imp, nhanes)

# show summary of quality of merging imputations
merge_imputations(nhanes, imp, summary = "dens", filter = c("chl", "hyp"))




