library(EMMAgeo)


### Name: check.data
### Title: Function to check data consistency.
### Aliases: check.data
### Keywords: EMMA

### ** Examples

## load example data set
data(X, envir = environment())

## perform data set check
check.data(X = X,
           q = 6,
           l = seq(from = 0,
                   to = 0.2,
                   by = 0.01),
           c = 1)



