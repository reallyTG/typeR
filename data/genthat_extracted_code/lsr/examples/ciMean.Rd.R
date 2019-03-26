library(lsr)


### Name: ciMean
### Title: Confidence interval around the mean
### Aliases: ciMean

### ** Examples

X <- c(1, 3, 6)          # data 
ciMean(X)                # 95 percent confidence interval
ciMean(X, conf = .8)     # 80 percent confidence interval

confint( lm(X ~ 1) )     # for comparison purposes

X <- c(1, 3, NA, 6)      # data with missing values
ciMean(X, na.rm = TRUE)  # remove missing values




