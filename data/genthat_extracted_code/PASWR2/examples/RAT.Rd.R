library(PASWR2)


### Name: RAT
### Title: Rat Survival Time
### Aliases: RAT
### Keywords: datasets

### ** Examples

ggplot(data = RAT, aes(sample = survival.time)) + stat_qq()
ggplot(data = RAT, aes(x = survival.time)) + geom_density(alpha = 0.2, fill = "blue") +
labs(x = "Survival time in weeks")



