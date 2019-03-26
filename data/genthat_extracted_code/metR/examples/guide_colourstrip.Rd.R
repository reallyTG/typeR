library(metR)


### Name: guide_colourstrip
### Title: Discretized continuous color guide
### Aliases: guide_colourstrip guide_train.colorstrip guide_colorstrip
###   guide_gengrob.colorstrip
### Keywords: internal

### ** Examples

# In this example the lowest color represents an area of the data with values
# between 80 and 100.
library(ggplot2)
binwidth <- 20
data(volcano)
ggplot(reshape2::melt(volcano), aes(Var1, Var2, z = value)) +
    geom_contour_fill(binwidth = binwidth) +
    scale_fill_continuous(guide = guide_colourstrip(),
                         breaks = MakeBreaks(binwidth))

# Difference between guide_legend() and guide_colorbar2(inside = T)
df <- reshape2::melt(outer(1:4, 1:4), varnames = c("X1", "X2"))
g <- ggplot(df, aes(X1, X2)) +
        geom_tile(aes(fill = value)) +
        theme(legend.position = "bottom")

# Tick labels are to the side
g + scale_fill_continuous(guide = guide_legend())
# Tick labels are at the bottom
g + scale_fill_continuous(guide = guide_colourstrip(inside = TRUE))




