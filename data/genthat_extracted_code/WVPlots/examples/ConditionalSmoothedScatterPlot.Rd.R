library(WVPlots)


### Name: ConditionalSmoothedScatterPlot
### Title: Plot a scatter plot with smoothing line.
### Aliases: ConditionalSmoothedScatterPlot

### ** Examples


y = c(1,2,3,4,5,10,15,18,20,25)
x = seq_len(length(y))
df = data.frame(x=x, y=y, group=x>5)
WVPlots::ConditionalSmoothedScatterPlot(df, "x", "y", NULL,
   title="left smooth, one groups", align="left")
WVPlots::ConditionalSmoothedScatterPlot(df, "x", "y", "group",
   title="left smooth, two groups", align="left")




