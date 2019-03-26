library(robCompositions)


### Name: biplot.factanal
### Title: Biplot method
### Aliases: biplot.factanal
### Keywords: aplot

### ** Examples

data(expenditures)
res.rob <- pfa(expenditures, factors=2, scores = "regression")
biplot(res.rob)



