library(SIN)


### Name: is.blocks
### Title: Check variable blocking
### Aliases: is.blocks
### Keywords: multivariate

### ** Examples

p <- 6
blocks <- list(1:3,6,5:4)
is.blocks(blocks, p)
blocks <- list(1:3,7,5:4)
is.blocks(blocks, p)
blocks <- list(1:2,6,5:4)
is.blocks(blocks, p)



