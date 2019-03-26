library(WVPlots)


### Name: PlotDistDensityBeta
### Title: Plot an empirical density with the matching beta distribution
### Aliases: PlotDistDensityBeta

### ** Examples


set.seed(52523)
d <- data.frame(wt=rbeta(100,shape1=1,shape2=0.5))
PlotDistDensityBeta(d,'wt','example')




