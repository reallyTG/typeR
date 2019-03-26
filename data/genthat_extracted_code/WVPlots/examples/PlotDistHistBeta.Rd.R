library(WVPlots)


### Name: PlotDistHistBeta
### Title: Plot distribution details as a histogram plus matching beta
### Aliases: PlotDistHistBeta

### ** Examples


set.seed(52523)
d <- data.frame(wt=rbeta(100,shape1=0.5,shape2=0.5))
PlotDistHistBeta(d,'wt','example')




