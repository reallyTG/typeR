library(RSDA)


### Name: sym.scatterplot.ggplot
### Title: Symbolic Scatter GGPlot
### Aliases: sym.scatterplot.ggplot
### Keywords: Symbolic ggplot

### ** Examples

data(lynne1)
class(lynne1) <- c('sym.data.table')
sym.scatterplot.ggplot(lynne1[,1], lynne1[,3],labels=TRUE)
data(oils)
sym.scatterplot.ggplot(oils[,2], oils[,3],labels=TRUE)



