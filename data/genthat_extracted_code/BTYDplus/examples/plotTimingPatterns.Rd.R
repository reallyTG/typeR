library(BTYDplus)


### Name: plotTimingPatterns
### Title: Plot timing patterns of sampled customers
### Aliases: plotTimingPatterns

### ** Examples

data("groceryElog")
plotTimingPatterns(groceryElog, T.tot = "2008-12-31")
plotTimingPatterns(groceryElog, T.cal = "2006-12-31", headers = c("Calibration", "Holdout"))



