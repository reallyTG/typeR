library(WVPlots)


### Name: PlotDistCountNormal
### Title: Plot distribution details as a histogram plus matching normal
### Aliases: PlotDistCountNormal

### ** Examples


set.seed(52523)
d <- data.frame(wt=100*rnorm(100))
PlotDistCountNormal(d,'wt','example')




