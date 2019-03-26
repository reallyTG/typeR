library(riskyr)


### Name: plot_icons
### Title: Plot an icon array of a population.
### Aliases: plot_icons

### ** Examples

# ways to work:
plot_icons()  # => plots icon array for default population (with default type = "array")
plot_icons(type = "shuffledarray")  # => icon array with shuffled IDs

plot_icons(type = "mosaic",    N = 1000)  # => areas as in mosaic plot
plot_icons(type = "fillequal", N = 1000)  # => areas of equal size (density reflects probability)
plot_icons(type = "fillleft",  N = 1000)  # => icons filled from left to right (in columns)
plot_icons(type = "filltop",   N = 1000)  # => icons filled from top to bottom (in rows)

plot_icons(icon.types = c(21,23,24,23),
               block.size.row = 5, block.size.col = 5, #nblocks.row = 2, nblocks.col = 2,
               block.d = 0.5, border.d = 0.9)
plot_icons(type = "scatter",   N = 1000)  # => icons randomly scattered.

# some variants:
plot_icons(N = 800, type = "array", icon.types = c(21,22,23,24),
           block.d = 0.5, border.d = 0.5)

plot_icons(N = 1250, sens = 0.9, spec = 0.9, prev = 0.9,
               icon.types = c(21,23,24,23),
               block.size.row = 10, block.size.col = 5,
               nblocks.row = 5, nblocks.col = 5,
               block.d = 0.8,
               border.d = 0.2,
               fill.array = "top")
plot_icons(N = 800, type = "shuffledarray", icon.types = c(21,23,24,22),
           block.d = 0.5, border.d = 0.5)

plot_icons(N = 800, type = "shuffledarray", icon.types = c(21,23,24,22),
           icon.border.col = grey(.33, .99), icon.border.lwd = 3)

plot_icons(N = 800, type = "fillequal", icon.types = c(21,22,22,21),
           icon.border.lwd = .5, cex = 3)





