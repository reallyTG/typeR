library(jointseg)


### Name: binMissingValues
### Title: binMissingValues
### Aliases: binMissingValues

### ** Examples


sim <- randomProfile(10, 1, 0.1, 3)
Y <- sim$profile
Y[c(4, 8), 2] <- NA
Y[c(7, 8), 3] <- NA

res <- binMissingValues(Y)

Y <- sim$profile
Y[1:5, 2] <- NA
Yb <- binMissingValues(Y)

Y <- sim$profile
Y[3:5, 2] <- NA
Yb <- binMissingValues(Y)




