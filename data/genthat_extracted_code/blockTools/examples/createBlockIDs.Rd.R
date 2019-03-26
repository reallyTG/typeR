library(blockTools)


### Name: createBlockIDs
### Title: Create vector of integers containing block identifiers
### Aliases: createBlockIDs
### Keywords: design

### ** Examples

data(x100)
out <- block(x100, groups = "g", n.tr = 2, id.vars = c("id"), block.vars
             = c("b1", "b2"))
createBlockIDs(out, x100, id.var = "id")
## block ID integers are unique, even with several groups



