library(ape)


### Name: kronoviz
### Title: Plot Multiple Chronograms on the Same Scale
### Aliases: kronoviz
### Keywords: hplot

### ** Examples

TR <- replicate(10, rcoal(sample(11:20, size = 1)), simplify = FALSE)
kronoviz(TR)
kronoviz(TR, horiz = FALSE, type = "c", show.tip.label = FALSE)



