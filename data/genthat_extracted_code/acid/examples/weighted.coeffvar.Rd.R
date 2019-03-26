library(acid)


### Name: weighted.coeffvar
### Title: Coefficient of Variation
### Aliases: weighted.coeffvar

### ** Examples

# generate vector (of incomes)
x <- c(541, 1463, 2445, 3438, 4437, 5401, 6392, 8304, 11904, 22261)
w <- sample(1:10,length(x), replace=TRUE)
weighted.coeffvar(x,w)



