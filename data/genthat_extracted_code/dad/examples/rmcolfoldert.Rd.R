library(dad)


### Name: rmcol.foldert
### Title: Remove cols in all elements of a foldert
### Aliases: rmcol.foldert

### ** Examples

data(floribundity)

ft0 <- foldert(floribundity, cols.select = "union", rows.select = "union")
ft0
rmcol.foldert(ft0, c("area"))



