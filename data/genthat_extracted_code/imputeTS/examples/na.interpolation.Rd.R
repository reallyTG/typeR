library(imputeTS)


### Name: na.interpolation
### Title: Missing Value Imputation by Interpolation
### Aliases: na.interpolation

### ** Examples

#Prerequisite: Create Time series with missing values
x <- ts(c(2,3,4,5,6,NA,7,8))

#Example 1: Perform linear interpolation
na.interpolation(x)

#Example 2: Perform spline interpolation
na.interpolation(x, option = "spline")

#Example 3: Perform stine interpolation
na.interpolation(x, option = "stine")

#Example 4: Same as example 1, just written with pipe operator
x %>% na.interpolation

#Example 5: Same as example 2, just written with pipe operator
x %>% na.interpolation(option = "spline")




