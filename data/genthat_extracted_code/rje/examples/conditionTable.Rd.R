library(rje)


### Name: conditionTable
### Title: Find conditional probability table
### Aliases: conditionTable conditionTable2 condition.table
###   condition.table2 marginMatrix conditionMatrix
### Keywords: array

### ** Examples

x = array(1:16, rep(2,4))
x = x/sum(x) # probability distribution on 4 binary variables x1, x2, x3, x4.

# distribution of x2, x3 given x1 = 1 and x4=2.
conditionTable(x, c(2,3), c(1,4), c(1,2))
# x2, x3 given x1 = 1,2 and x4 = 2.
conditionTable(x, c(2,3), c(1,4), list(1:2,2))

# complete conditional of x2, x3 given x1, x4
conditionTable(x, c(2,3), c(1,4))

# conditionTable2 leaves dimensions unchanged
tmp = conditionTable2(x, c(2,3), c(1,4))
aperm(tmp, c(2,3,1,4))

####
set.seed(2314)
# set of 10 2x2x2 probability distributions
x = rdirichlet(10, rep(1,8))

marginMatrix(x, c(1,3))

conditionMatrix(x, 3, 1)
conditionMatrix(x, 3, 1, 2)

marginMatrix(t(x), c(1,3), incols=TRUE)



