library(tmod)


### Name: hgEnrichmentPlot
### Title: Create a visualisation of enrichment
### Aliases: hgEnrichmentPlot

### ** Examples

set.seed(123)
data(tmod)
bg <- tmod$GENES$ID
fg <- sample(c(tmod$MODULES2GENES[["LI.M127"]], bg[1:1000]))
hgEnrichmentPlot(fg, bg, "LI.M127")



