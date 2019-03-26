library(UsingR)


### Name: best.times
### Title: Best track and field times by age and distance
### Aliases: best.times
### Keywords: datasets

### ** Examples

data(best.times)
attach(best.times)
by.dist = split(best.times,as.factor(Dist))
lm(scale(Time) ~ age, by.dist[['400']])
dists = names(by.dist)
lapply(dists, function(n) print(lm(scale(Time) ~ age, by.dist[[n]])))



