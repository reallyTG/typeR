library(imputeTS)


### Name: na.replace
### Title: Replace Missing Values by a Defined Value
### Aliases: na.replace

### ** Examples

#Prerequisite: Create Time series with missing values
x <- ts(c(2,3,NA,5,6,NA,7,8))

#Example 1: Replace all NAs with 3.5
na.replace(x, fill = 3.5 )

#Example 2: Replace all NAs with 0
na.replace(x, fill = 0 ) 

#Example 3: Same as example 1, just written with pipe operator
x %>% na.replace(fill = 3.5 )




