library(lemon)


### Name: reposition_legend
### Title: Reposition a legend onto a panel
### Aliases: reposition_legend

### ** Examples

library(ggplot2)
dsamp <- diamonds[sample(nrow(diamonds), 1000), ]
(d <- ggplot(dsamp, aes(carat, price)) +
 geom_point(aes(colour = clarity)))

reposition_legend(d + theme(legend.position='bottom'), 'bottom right')

# To change the orientation of the legend, use theme's descriptors.
reposition_legend(d + theme(legend.position='bottom'), 'top left')

# Use odd specifications, here offset the legend with half its height from the bottom.
reposition_legend(d + theme(legend.position='bottom'), x=0.3, y=0, just=c(0, -0.5))

# For using with facets:
reposition_legend(d + facet_grid(.~cut), 'top left', panel = 'panel-3-1')



