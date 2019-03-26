library(lemon)


### Name: g_legend
### Title: Extract ggplot legends
### Aliases: g_legend

### ** Examples

library(ggplot2)
library(gtable)
library(grid)
library(gridExtra)
library(gtable)
dsamp <- diamonds[sample(nrow(diamonds), 1000), ]
(d <- ggplot(dsamp, aes(carat, price)) +
 geom_point(aes(colour = clarity)) +
 theme(legend.position='bottom'))

legend <- g_legend(d)
grid.newpage()
grid.draw(legend)

(d2 <- ggplot(dsamp, aes(x=carat, fill=clarity)) +
  geom_histogram(binwidth=0.1) +
 theme(legend.position='bottom'))

grid.arrange(d  + theme(legend.position='hidden'),
             d2 + theme(legend.position='hidden'),
             bottom=legend$grobs[[1]])
# Above fails with more than one guide

legend2 <- gtable_filter(ggplotGrob(d), 'guide-box')
grid.arrange(d  + theme(legend.position='hidden'),
             d2 + theme(legend.position='hidden'),
             bottom=legend2$grobs[[1]]$grobs[[1]])
# Above fails with more than one guide





