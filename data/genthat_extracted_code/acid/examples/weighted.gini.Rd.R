library(acid)


### Name: weighted.gini
### Title: Gini Coefficient
### Aliases: weighted.gini

### ** Examples

# generate vector (of incomes)
x <- c(541, 1463, 2445, 3438, 4437, 5401, 6392, 8304, 11904, 22261)
w <- sample(1:2,length(x),replace=TRUE)
weighted.gini(x,w)



