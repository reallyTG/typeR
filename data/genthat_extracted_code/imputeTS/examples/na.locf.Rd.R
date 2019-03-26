library(imputeTS)


### Name: na.locf
### Title: Missing Value Imputation by Last Observation Carried Forward
### Aliases: na.locf

### ** Examples

#Prerequisite: Create Time series with missing values
x <- ts(c(NA,3,4,5,6,NA,7,8))

#Example 1: Perform LOCF
na.locf(x)

#Example 2: Perform NOCF
na.locf(x, option = "nocb")

#Example 3: Perform LOCF and remove remaining NAs
na.locf(x, na.remaining = "rm")

#Example 4: Same as example 1, just written with pipe operator
x %>% na.locf




