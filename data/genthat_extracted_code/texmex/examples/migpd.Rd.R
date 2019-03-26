library(texmex)


### Name: ggplot.migpd
### Title: Fit multiple independent generalized Pareto models
### Aliases: ggplot.migpd migpd plot.migpd
### Keywords: models multivariate

### ** Examples


mygpd <- migpd(winter, mqu=.7, penalty = "none")
mygpd
summary(mygpd)
plot(mygpd)
g <- ggplot(mygpd)





