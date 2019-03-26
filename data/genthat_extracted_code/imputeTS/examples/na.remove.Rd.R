library(imputeTS)


### Name: na.remove
### Title: Remove Missing Values
### Aliases: na.remove

### ** Examples

#Example 1: Remove all NAs
#Create Time series with missing values
x <- ts(c(2,3,NA,5,6,NA,7,8))

#Example 1: Remove all NAs
na.remove(x)

#Example 2: Remove all NAs in tsAirgap
na.remove(tsAirgap)

#Example 3: Same as example 1, just written with pipe operator
x %>% na.remove




