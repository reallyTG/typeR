library(imputeTS)


### Name: na.ma
### Title: Missing Value Imputation by Weighted Moving Average
### Aliases: na.ma

### ** Examples

#Example 1: Perform imputation with simple moving average
na.ma(tsAirgap, weighting = "simple")

#Example 2: Perform imputation with exponential weighted moving average
na.ma(tsAirgap)

#Example 3: Perform imputation with exponential weighted moving average, window size 6
na.ma(tsAirgap, k=6)

#Example 4: Same as example 1, just written with pipe operator
tsAirgap %>% na.ma(weighting = "simple")




