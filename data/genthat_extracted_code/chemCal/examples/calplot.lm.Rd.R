library(chemCal)


### Name: calplot
### Title: Plot calibration graphs from univariate linear models
### Aliases: calplot calplot.default calplot.lm
### Keywords: regression

### ** Examples

data(massart97ex3)
m <- lm(y ~ x, data = massart97ex3)
calplot(m)



