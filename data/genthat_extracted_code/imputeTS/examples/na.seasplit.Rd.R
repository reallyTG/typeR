library(imputeTS)


### Name: na.seasplit
### Title: Seasonally Splitted Missing Value Imputation
### Aliases: na.seasplit

### ** Examples

#Example 1: Perform seasonal splitted imputation using algorithm = "interpolation"
na.seasplit(tsAirgap, algorithm = "interpolation")

#Example 2: Perform seasonal splitted imputation using algorithm = "mean"
na.seasplit(tsAirgap, algorithm = "mean")

#Example 3: Same as example 1, just written with pipe operator
tsAirgap %>% na.seasplit(algorithm = "interpolation")




