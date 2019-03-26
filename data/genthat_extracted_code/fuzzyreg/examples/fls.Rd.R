library(fuzzyreg)


### Name: fls
### Title: Fuzzy Linear Regression using the Fuzzy Least Squares Method
### Aliases: fls
### Keywords: fuzzy

### ** Examples

   data(fuzzydat)
   x <- fuzzydat$dia[, 1, drop = FALSE]
   x <- cbind(rep(1, nrow(x)), x)
   y <- fuzzydat$dia[, c(2,3,3)]
   fls(x = x, y = y)



