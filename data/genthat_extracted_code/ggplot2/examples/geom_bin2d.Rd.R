library(ggplot2)


### Name: geom_bin2d
### Title: Heatmap of 2d bin counts
### Aliases: geom_bin2d stat_bin_2d stat_bin2d

### ** Examples

d <- ggplot(diamonds, aes(x, y)) + xlim(4, 10) + ylim(4, 10)
d + geom_bin2d()

# You can control the size of the bins by specifying the number of
# bins in each direction:
d + geom_bin2d(bins = 10)
d + geom_bin2d(bins = 30)

# Or by specifying the width of the bins
d + geom_bin2d(binwidth = c(0.1, 0.1))



