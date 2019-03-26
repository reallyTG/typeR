library(PASWR2)


### Name: WATER
### Title: Sodium Content of Water
### Aliases: WATER
### Keywords: datasets

### ** Examples

ggplot(data = WATER, aes(x = sodium, y = ..density.., fill = source)) + 
geom_density(alpha = 0.2)
t.test(sodium ~ source, data = WATER, alternative = "less")



