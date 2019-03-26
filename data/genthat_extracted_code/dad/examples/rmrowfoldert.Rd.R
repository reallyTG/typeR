library(dad)


### Name: rmrow.foldert
### Title: Remove rows in all elements of a foldert
### Aliases: rmrow.foldert

### ** Examples

data(floribundity)

ft0 <- foldert(floribundity, cols.select = "union", rows.select = "union")
ft0
rmrow.foldert(ft0, c("rose", c("16", "51")))



