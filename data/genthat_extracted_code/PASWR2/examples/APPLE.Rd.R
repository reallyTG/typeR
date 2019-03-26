library(PASWR2)


### Name: APPLE
### Title: Apple Hardness
### Aliases: APPLE
### Keywords: datasets

### ** Examples

# ggplot2 approach
ggplot(data = APPLE, aes(sample = hardness)) + stat_qq() + facet_grid(. ~ location)
ggplot(data = APPLE, aes(sample = hardness, color = location)) + stat_qq()
ggplot(data = APPLE, aes(x = hardness, fill = location)) + geom_density(alpha = 0.4) + 
scale_fill_brewer()
# lattice approach
qqmath(~hardness|location, data = APPLE)
qqmath(~hardness, group = location, type = c('p', 'r'), auto.key = TRUE, data = APPLE)



