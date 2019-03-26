library(ggplot2)


### Name: coord_fixed
### Title: Cartesian coordinates with fixed "aspect ratio"
### Aliases: coord_fixed coord_equal

### ** Examples

# ensures that the ranges of axes are equal to the specified ratio by
# adjusting the plot aspect ratio

p <- ggplot(mtcars, aes(mpg, wt)) + geom_point()
p + coord_fixed(ratio = 1)
p + coord_fixed(ratio = 5)
p + coord_fixed(ratio = 1/5)
p + coord_fixed(xlim = c(15, 30))

# Resize the plot to see that the specified aspect ratio is maintained



