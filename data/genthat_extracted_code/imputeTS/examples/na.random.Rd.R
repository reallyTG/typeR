library(imputeTS)


### Name: na.random
### Title: Missing Value Imputation by Random Sample
### Aliases: na.random

### ** Examples

#Prerequisite: Create Time series with missing values
x <- ts(c(2,3,NA,5,6,NA,7,8))

#Example 1: Replace all NAs by random values that are between min and max of the input time series
na.random(x)

#Example 2: Replace all NAs by random values between 1 and 10
na.random(x, lowerBound = 1, upperBound = 10)

#Example 3: Same as example 1, just written with pipe operator
x %>% na.random




