library(blockTools)


### Name: block2seqblock
### Title: Prepare prior nonsequential assignments for subsequent
###   sequential assignments
### Aliases: block2seqblock
### Keywords: design

### ** Examples

# data(x100)
# out <- block(x100, n.tr = 2, id.vars = c("id"), block.vars = c("b1", "b2"), 
#   algorithm = "optGreedy", distance = "mahalanobis", valid.var = "b1", valid.range = c(0,500))
# assg.out <- assignment(out, seed = 123)
# b2sb <- block2seqblock(block.obj = out, assg.obj = assg.out, data = x100)
# sb <- seqblock("sbout.RData", id.vals = 1101, covar.vals = c(100, 200), file.name = "sb101.RData")



