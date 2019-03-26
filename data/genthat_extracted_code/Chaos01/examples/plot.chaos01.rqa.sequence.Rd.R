library(Chaos01)


### Name: plot.chaos01.rqa.sequence
### Title: Plot the results for the sequence of eps values.
### Aliases: plot.chaos01.rqa.sequence
### Keywords: plot rqa threshold

### ** Examples

vec.x <- gen.logistic(mu = 3.55, iter = 2000)

x.range <- diff(range(vec.x))

from = 0.01 * x.range
by   = 0.1 * x.range

#Output for each value of c
res <- rqa.seq(vec.x, from = from, to = x.range, by = by, TS = vec.x, dim = 3, lag = 10)

plotvar <- c("RR", "DET", "RATIO", "LAM")

par(mfrow = c(2,2))
plot(res, plotvar = plotvar)



