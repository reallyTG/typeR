library(BBmisc)


### Name: mapValues
### Title: Replace values in atomic vectors
### Aliases: mapValues

### ** Examples

# replace integers
x = 1:5
mapValues(x, c(2, 3), c(99, 100))

# replace factor levels using regex matching
x = factor(c("aab", "aba", "baa"))
mapValues(x, "a.a", "zzz", regex = TRUE)



