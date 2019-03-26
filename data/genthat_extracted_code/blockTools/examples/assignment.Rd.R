library(blockTools)


### Name: assignment
### Title: Randomly assign blocked units to treatment conditions
### Aliases: assignment
### Keywords: design

### ** Examples

data(x100)

## First, block
out <- block(x100, groups = "g", n.tr = 2, id.vars = c("id"), block.vars
             = c("b1", "b2"), algorithm="optGreedy", distance =
             "mahalanobis", level.two = FALSE, valid.var = "b1",
             valid.range = c(0,500), verbose = TRUE)
## Second, assign
assigned <- assignment(out, seed = 123)
## assigned$assg contains 3 data frames



