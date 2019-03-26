library(BrailleR)


### Name: VI.ggplot
### Title: VI for graphs created using ggplot2
### Aliases: VI.ggplot print.VIgraph

### ** Examples

if(require(ggplot2)){
g = ggplot(economics_long, aes(date, value01, colour = variable))
g = g + geom_line() + ggtitle('dummy title')
VI(g)
g
}



