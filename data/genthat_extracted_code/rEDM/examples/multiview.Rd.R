library(rEDM)


### Name: multiview
### Title: Perform forecasting using multiview embedding
### Aliases: multiview

### ** Examples

data("block_3sp")
block <- block_3sp[, c(2, 5, 8)]
multiview(block, k = c(1, 3, "sqrt"))




