library(imputeTS)


### Name: na.mean
### Title: Missing Value Imputation by Mean Value
### Aliases: na.mean

### ** Examples

#Prerequisite: Create Time series with missing values
x <- ts(c(2,3,4,5,6,NA,7,8))

#Example 1: Perform imputation with the overall mean
na.mean(x)

#Example 2: Perform imputation with overall median
na.mean(x, option ="median")

#Example 3: Same as example 1, just written with pipe operator
x %>% na.mean




