library(cowplot)


### Name: plot_grid
### Title: Arrange multiple plots into a grid
### Aliases: plot_grid

### ** Examples

p1 <- qplot(1:10, 1:10)
p2 <- qplot(1:10, (1:10)^2)
p3 <- qplot(1:10, (1:10)^3)
p4 <- qplot(1:10, (1:10)^4)
p5 <- ggplot(mpg, aes(as.factor(year), hwy)) +
        geom_boxplot() +
        facet_wrap(~class, scales = "free_y")
# simple grid
plot_grid(p1, p2, p3, p4)

# simple grid with labels and aligned plots
plot_grid(p1, p2, p3, p4, labels=c('A', 'B', 'C', 'D'), align="hv")

# manually setting the number of rows, auto-generate upper-case labels
plot_grid(p1, p2, p3, nrow=3, labels="AUTO", label_size=12, align="v")

# making rows and columns of different widths/heights
plot_grid(p1, p2, p3, p4, align='hv', rel_heights=c(2,1), rel_widths=c(1,2))

# aligning complex plots in a grid
plot_grid(p1, p5, align="h", axis="b", nrow = 1, rel_widths = c(1,2))

# more examples
## No test: 
#' # missing plots in some grid locations, auto-generate lower-case labels
plot_grid(p1, NULL, NULL, p2, p3, NULL, ncol=2,
 labels="auto", label_size=12, align="v")

# can align top of plotting area as well as bottom
plot_grid(p1, p5, align="h", axis="tb", nrow = 1, rel_widths = c(1,2))

# other types of plots not generated with ggplot
dev.new()
par(xpd = NA, # switch off clipping, necessary to always see axis labels
    bg = "transparent", # switch off background to avoid obscuring adjacent plots
    oma = c(2, 2, 0, 0), # move plot to the right and up
    mgp = c(2, 1, 0) # move axis labels closer to axis
)
plot(sqrt)
p6 <- recordPlot()
dev.off()
p7 <- function() image(volcano)
p8 <- grid::circleGrob()

plot_grid(p1, p6, p7, p8, labels = "AUTO", scale = c(1, 1, .85, .9))
## End(No test)



