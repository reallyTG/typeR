library(PASWR2)


### Name: BATTERY
### Title: Lithium Batteries
### Aliases: BATTERY
### Keywords: datasets

### ** Examples

p <- ggplot(data = BATTERY, aes(x = lifetime, color = facility))
p + geom_density()
q <- ggplot(data = BATTERY, aes(x = facility, y = lifetime))
q + geom_violin()
ggplot(data = BATTERY, aes(x = facility, y = lifetime, fill = facility)) + 
geom_violin() + scale_fill_brewer() + guides(fill = FALSE)
ggplot(data = BATTERY, aes(sample = lifetime)) + stat_qq() + facet_grid(. ~ facility)
ggplot(data = BATTERY, aes(sample = lifetime, color = facility)) + stat_qq()
# lattice approach
qqmath(~ lifetime|facility, data = BATTERY)
qqmath(~ lifetime, group = facility, type = c('p', 'r'), auto.key=TRUE, data = BATTERY)



