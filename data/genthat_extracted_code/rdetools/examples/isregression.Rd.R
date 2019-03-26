library(rdetools)


### Name: isregression
### Title: Estimate from labels whether this is a regression problem
### Aliases: isregression
### Keywords: classif regression

### ** Examples

## some examples
y_cl <- c(-1, 1, 1, -1, 1) # label vector for classification problem
y_reg <- runif(5) # label vector for regression problem
isregression(y_cl) # FALSE!
isregression(y_cl, regression = TRUE) # Always TRUE!
isregression(y_reg) # TRUE!



