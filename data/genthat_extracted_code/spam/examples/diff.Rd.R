library(spam)


### Name: diff
### Title: Lagged Differences
### Aliases: diff.spam diff,spam-method
### Keywords: array manip

### ** Examples

# incidence matrix for a RW(3) model
D <- diff.spam(diag.spam(10), lag=1, differences=3)
 t(D)



