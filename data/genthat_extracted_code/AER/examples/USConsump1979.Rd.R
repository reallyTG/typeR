library(AER)


### Name: USConsump1979
### Title: US Consumption Data (1970-1979)
### Aliases: USConsump1979
### Keywords: datasets

### ** Examples

data("USConsump1979")
plot(USConsump1979)

## Example 1.1 in Greene (2003)
plot(expenditure ~ income, data = as.data.frame(USConsump1979), pch = 19)
fm <- lm(expenditure ~ income, data = as.data.frame(USConsump1979))
summary(fm)
abline(fm)



