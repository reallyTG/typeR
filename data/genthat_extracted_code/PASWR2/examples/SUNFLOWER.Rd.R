library(PASWR2)


### Name: SUNFLOWER
### Title: Sunflower Defoliation
### Aliases: SUNFLOWER
### Keywords: datasets

### ** Examples

summary(aov(yield ~ stage + defoli + stage:defoli, data = SUNFLOWER))
ggplot(data = SUNFLOWER, aes(numseed, yield, color = defoli)) + geom_point() + 
geom_smooth(method = "lm", se = FALSE) + facet_grid(location ~ .)



