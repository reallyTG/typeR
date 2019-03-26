library(dragonking)


### Name: dk_test
### Title: Statistical test to identify dragon kings (DKs)
### Aliases: dk_test

### ** Examples

# generate a numeric vector with DKs
temp <- c(rexp(100),   # exponentially distributed RV
          15, 15, 15)  # DK elements

# test for DKs, where r is number of DKs thought to be in temp
results <- dk_test(temp, r = 3)

# print out test statistic (should be large) and p-value (should be small)
print(paste("Test statistic =", results["Test Statistic"]))
print(paste("p-value =", results["p-value"]))



