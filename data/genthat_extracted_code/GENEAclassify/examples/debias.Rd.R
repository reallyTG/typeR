library(GENEAclassify)


### Name: debias
### Title: debias a vector
### Aliases: debias
### Keywords: internal

### ** Examples

    x1 <- c(-1, 1, 2, 2, 3, 3, 3, 4, 5)
    debias(x = x1)
    x2 <- c(-10, -10, -9, -8, -8, -7, -5, -4)
    debias(x = x2)
    debias(x = x2, fun = runmean, k = 3)
    x3 <- c(4, 2, 10, 2, 3 ,6, 7, 6, 1)
    debias(x = x3, fun = runmean, k = 4)



