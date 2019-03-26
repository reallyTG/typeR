library(blockTools)


### Name: blockTools-package
### Title: Block, Randomly Assign, and Diagnose Potential Interference in
###   Randomized Experiments
### Aliases: blockTools-package blockTools
### Keywords: package

### ** Examples

data(x100)

## block
out <- block(x100, groups = "g", n.tr = 2, id.vars = c("id"), block.vars
             = c("b1", "b2"), algorithm="optGreedy", distance =
             "mahalanobis", level.two = FALSE, valid.var = "b1",
             valid.range = c(0,500), verbose = TRUE)
## assign
assg <- assignment(out, seed = 123)
## diagnose
diag <- diagnose(object = assg, data = x100, id.vars = "id",
                suspect.var = "b2", suspect.range = c(0,50))
## create .tex files of assigned blocks
outTeX(assg)
## create .csv files of unassigned blocks
outCSV(out)
## create block IDs
createBlockIDs(out, x100, id.var = "id")
## block ID integers are unique, even with several groups
axb <- assg2xBalance(assg, x100, id.var = "id", bal.vars = c("b1", "b2"))



