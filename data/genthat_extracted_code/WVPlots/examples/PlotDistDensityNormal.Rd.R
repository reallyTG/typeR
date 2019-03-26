library(WVPlots)


### Name: PlotDistDensityNormal
### Title: Plot an empirical density with the matching normal distribution
### Aliases: PlotDistDensityNormal

### ** Examples


set.seed(52523)
d <- data.frame(wt=100*rnorm(100))
PlotDistDensityNormal(d,'wt','example')




