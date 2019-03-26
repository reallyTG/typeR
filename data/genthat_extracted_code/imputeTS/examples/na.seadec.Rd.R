library(imputeTS)


### Name: na.seadec
### Title: Seasonally Decomposed Missing Value Imputation
### Aliases: na.seadec

### ** Examples

#Example 1: Perform seasonal imputation using algorithm = "interpolation"
na.seadec(tsAirgap, algorithm = "interpolation")

#Example 2: Perform seasonal imputation using algorithm = "mean"
na.seadec(tsAirgap, algorithm = "mean")

#Example 3: Same as example 1, just written with pipe operator
tsAirgap %>% na.seadec(algorithm = "interpolation")




