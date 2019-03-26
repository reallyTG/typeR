library(PASWR2)


### Name: CHIPS
### Title: Silicon Chips
### Aliases: CHIPS
### Keywords: datasets

### ** Examples

# ggplot2 approach
ggplot(data = CHIPS, aes(sample = number)) + stat_qq() + facet_grid(. ~ method)
ggplot(data = CHIPS, aes(sample = number, color = method)) + stat_qq()
ggplot(data=BODYFAT, aes(x = fat, fill = sex)) + geom_density(alpha = 0.4) + 
scale_fill_brewer() 

# lattice approach
qqmath(~ number|method, data = CHIPS)
qqmath(~ number, group = method, type = c('p', 'r'), auto.key = TRUE, data = CHIPS)



