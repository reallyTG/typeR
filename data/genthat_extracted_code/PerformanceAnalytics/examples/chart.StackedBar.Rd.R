library(PerformanceAnalytics)


### Name: chart.StackedBar
### Title: create a stacked bar plot
### Aliases: chart.StackedBar

### ** Examples


data(weights)
head(weights)

# With the legend "under" the chart
chart.StackedBar(weights, date.format="%Y", cex.legend = 0.7, colorset=rainbow12equal)

# Without the legend
chart.StackedBar(weights, colorset=rainbow12equal, legend.loc=NULL)

# for one row of data, use 'unstacked' for a better chart
chart.StackedBar(weights[1,,drop=FALSE], unstacked=TRUE, las=3)




