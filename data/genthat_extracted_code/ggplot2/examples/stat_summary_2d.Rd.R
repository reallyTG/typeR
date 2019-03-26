library(ggplot2)


### Name: stat_summary_2d
### Title: Bin and summarise in 2d (rectangle & hexagons)
### Aliases: stat_summary_2d stat_summary2d stat_summary_hex

### ** Examples

d <- ggplot(diamonds, aes(carat, depth, z = price))
d + stat_summary_2d()

# Specifying function
d + stat_summary_2d(fun = function(x) sum(x^2))
d + stat_summary_2d(fun = var)
d + stat_summary_2d(fun = "quantile", fun.args = list(probs = 0.1))

if (requireNamespace("hexbin")) {
d + stat_summary_hex()
}



