library(modi)


### Name: weighted.var
### Title: Weighted univariate variance coping with missing values
### Aliases: weighted.var

### ** Examples

x <- rnorm(100)
x[sample(1:100, 20)] <- NA
w <- rchisq(100, 2)
weighted.var(x, w, na.rm = TRUE)



