library(PHEindicatormethods)


### Name: phe_rate
### Title: phe_rate
### Aliases: phe_rate

### ** Examples

df <- data.frame(area = rep(c("Area1","Area2","Area3","Area4"), 2),
                 year = rep(2015:2016, each = 4),
                 obs = sample(100, 2 * 4, replace = TRUE),
                 pop = sample(100:200, 2 * 4, replace = TRUE))
phe_rate(df, obs, pop)
phe_rate(df, obs, pop, type="full", confidence=99.8, multiplier=100)




