library(conf)


### Name: binomTestCoveragePlot
### Title: Coverage Plots for Binomial Proportions
### Aliases: binomTestCoveragePlot
### Keywords: confidence interval binomial proportion Clopper-Pearson
###   Wilson-Score Wald Agresti-Coull Jeffreys Arcsine Blaker

### ** Examples

  binomTestCoveragePlot(6)

  binomTestCoveragePlot(10, intervalType = "Wilson-Score", clo = 0.8)

  binomTestCoveragePlot(n = 100, intervalType = "Wald", clo = 0, chi = 1, points = 30)

  


