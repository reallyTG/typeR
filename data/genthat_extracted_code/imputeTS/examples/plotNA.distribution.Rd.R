library(imputeTS)


### Name: plotNA.distribution
### Title: Visualize Distribution of Missing Values
### Aliases: plotNA.distribution

### ** Examples

#Example 1: Visualize the missing values in x
x <- ts(c(1:11, 4:9,NA,NA,NA,11:15,7:15,15:6,NA,NA,2:5,3:7))
plotNA.distribution(x)

#Example 2: Visualize the missing values in tsAirgap time series
plotNA.distribution(tsAirgap)

#Example 3: Same as example 1, just written with pipe operator
x <- ts(c(1:11, 4:9,NA,NA,NA,11:15,7:15,15:6,NA,NA,2:5,3:7))
x %>% plotNA.distribution




