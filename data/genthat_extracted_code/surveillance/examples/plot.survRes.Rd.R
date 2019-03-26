library(surveillance)


### Name: plot.survRes
### Title: Plot a survRes object
### Aliases: plot.survRes plot.survRes.one
### Keywords: hplot

### ** Examples

data(ha)
ctrl <- list(range = 209:290, b = 2, w = 6, alpha = 0.005)
plot(algo.bayes(aggregate(ha), control = ctrl))



