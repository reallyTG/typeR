library(ineq)


### Name: major
### Title: Majorization
### Aliases: major
### Keywords: logic

### ** Examples

# generate vectors (of incomes)
x <- c(541, 1463, 2445, 3438, 4437, 5401, 6392, 8304, 11904, 22261)
y <- c(841, 2063, 2445, 3438, 4437, 5401, 6392, 8304, 11304, 21961)
# test whether x majorizes y (TRUE, because y is result of
# Pigou-Dalton-transfers)
major(x,y)



