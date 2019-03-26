library(ggplot2)


### Name: geom_hex
### Title: Hexagonal heatmap of 2d bin counts
### Aliases: geom_hex stat_bin_hex stat_binhex

### ** Examples

d <- ggplot(diamonds, aes(carat, price))
d + geom_hex()

## No test: 
# You can control the size of the bins by specifying the number of
# bins in each direction:
d + geom_hex(bins = 10)
d + geom_hex(bins = 30)

# Or by specifying the width of the bins
d + geom_hex(binwidth = c(1, 1000))
d + geom_hex(binwidth = c(.1, 500))
## End(No test)



