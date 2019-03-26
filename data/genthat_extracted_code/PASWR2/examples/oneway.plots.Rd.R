library(PASWR2)


### Name: oneway.plots
### Title: Exploratory Graphs for Single Factor Designs
### Aliases: oneway.plots
### Keywords: hplot

### ** Examples

with(data = TIRE, oneway.plots(stopdist, tire))
## Similar graphs with ggplot2 
ggplot(data = TIRE, aes(tire, stopdist, fill = tire)) + 
geom_dotplot(binaxis = "y", stackdir = "center") + coord_flip() + theme_bw()
ggplot(data = TIRE, aes(tire, stopdist, fill = tire)) + geom_boxplot() +
guides(fill = FALSE) + theme_bw()




