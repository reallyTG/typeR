library(tmod)


### Name: evidencePlot
### Title: Create an evidence plot for a module
### Aliases: evidencePlot

### ** Examples

# artificially enriched list of genes
set.seed(123)
data(tmod)
bg <- tmod$GENES$ID
fg <- sample(c(tmod$MODULES2GENES[["LI.M127"]], bg[1:1000]))
l <- unique(c(fg, bg))
evidencePlot(l, "LI.M127")
evidencePlot(l, filter=TRUE, "LI.M127")



