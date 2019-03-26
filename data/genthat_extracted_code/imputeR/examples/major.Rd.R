library(imputeR)


### Name: major
### Title: Majority imputation for a vector
### Aliases: major

### ** Examples

a <- c(rep(0, 10), rep(1, 15), rep(2, 5))
a[sample(seq_along(a), 5)] <- NA
a
b <- major(a)
b



