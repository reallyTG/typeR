library(emil)


### Name: na_index
### Title: Support function for identifying missing values
### Aliases: na_index

### ** Examples

x <- as.matrix(iris[-5])
y <- iris$Species
x[sample(length(x), 10)] <- NA
cv <- resample("crossvalidation", y)
sets <- pre_split(x, y, cv[[1]])
sets <- pre_remove(sets, 3L)
na_index(sets)



