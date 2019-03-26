library(modeest)


### Name: naive
### Title: The Chernoff or 'naive' mode estimator
### Aliases: naive Chernoff chernoff

### ** Examples

# Unimodal distribution
x <- rf(10000, df1 = 40, df2 = 30)

## True mode
fMode(df1 = 40, df2 = 30)

## Estimate of the mode
mean(naive(x, bw = 1/4))
mlv(x, method = "naive", bw = 1/4)




