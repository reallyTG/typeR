library(isocir)


### Name: datareplic
### Title: Random Circular Data with Replications.
### Aliases: datareplic
### Keywords: datasets circular

### ** Examples

data(datareplic)

# example testing the next order:
orderGroups2 <- c(1:8)

example2test <- cond.test(datareplic, groups = orderGroups2, bias = TRUE)
example2test


round(unlist(example2test$cirmeans), digits = 3)




