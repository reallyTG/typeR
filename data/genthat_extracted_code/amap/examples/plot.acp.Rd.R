library(amap)


### Name: plot
### Title: Graphics for Principal component Analysis
### Aliases: plot.acp biplot.acp plot2 plotAll
### Keywords: multivariate

### ** Examples

data(lubisch)
lubisch <- lubisch[,-c(1,8)]
p <- acp(lubisch)
plotAll(p)



