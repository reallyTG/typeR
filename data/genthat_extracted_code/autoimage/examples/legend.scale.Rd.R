library(autoimage)


### Name: legend.scale
### Title: Color scale legend
### Aliases: legend.scale

### ** Examples

# default horizontal scale
legend.scale(c(0, 1))

# default vertical scale
legend.scale(c(0, 1), horizontal = FALSE)

# different color scheme with 24 colors
legend.scale(c(0, 1), col = cm.colors(24))

# irregular color breaks
legend.scale(c(0, 1), col = heat.colors(4), 
             breaks = c(0, 0.5, 0.75, 0.875, 1))

# irregular color breaks with modified ticks and vertical 
# orientation of labels
legend.scale(c(0, 1), col = heat.colors(4),
             breaks = c(0, 0.5, 0.75, 0.875, 1),
             axis.args = list(at = c(0, 0.5, 0.75, 0.875, 1), las = 2))

# change size of axis labels
legend.scale(c(0, 1), axis.args = list(cex.axis = 2))

# change color of axis labels and ticks
blue.axes <- list(col.axis = "blue", col.ticks = "blue")
legend.scale(c(0, 1), axis.args = blue.axes)

# log base 10 values with colors labeled on original scale
options(scipen = 2)
log.axis <- list(at = 0:6, labels = 10^(0:6), las = 2)
legend.scale(c(0, 6), col = heat.colors(6), axis.args = log.axis)



