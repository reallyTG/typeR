library(blockTools)


### Name: assg2xBalance
### Title: Calculate balance statistics from an assignment object
### Aliases: assg2xBalance
### Keywords: design multivariate

### ** Examples

data(x100)
b <- block(x100, groups = "g", id.vars = "id", block.vars = c("b1", "b2"))
a <- assignment(b)
axb <- assg2xBalance(a, x100, id.var = "id", bal.vars = c("b1", "b2"))
axb
## axb is a list with 4 elements (one for each of 3 groups, plus one for 'Overall')



