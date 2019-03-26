library(DescTools)


### Name: PlotBubble
### Title: Draw a Bubble Plot
### Aliases: PlotBubble PlotBubble.default PlotBubble.formula
### Keywords: hplot

### ** Examples

PlotBubble(latitude ~ longitude, area=(smoky+1)*2e8,
           col=SetAlpha(1, 0.5), data=d.whisky)


cols <- c("olivedrab1","orange","green","mediumturquoise","mediumorchid2","firebrick1")
PlotBubble(x = state.x77[,"Income"], y = state.x77[,"Life Exp"], cex=.00004,
           area = state.x77[,"Population"], col = cols[state.region], border="grey50",
           panel.first=grid(), xlab="Income", ylab="Life Exp.", las=1
)

BubbleLegend(x = "topright", area = c(20000, 10000, 1000), cex=.00004, frame=NA,
             cols=cols[1:3], labels = c(20000, 10000, 1000), cex.names=0.7)

legend(x="bottomright", fill=cols[1:4], legend=levels(state.region))




