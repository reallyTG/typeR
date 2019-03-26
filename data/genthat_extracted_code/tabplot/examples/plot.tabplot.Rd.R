library(tabplot)


### Name: plot.tabplot
### Title: Plot a tabplot-object
### Aliases: plot.tabplot plot.tabplot_compare

### ** Examples

# load diamonds dataset from ggplot2
require(ggplot2)
data(diamonds)

tab <- tableplot(diamonds)
plot(tab, title="Shine on you Crazy Diamond!!!",
	 fontsize=12,
	 legend.lines=7,
	 fontsize.title=16)




