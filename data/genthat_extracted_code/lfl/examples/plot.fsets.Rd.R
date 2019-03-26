library(lfl)


### Name: plot.fsets
### Title: Plot a 'fsets' object
### Aliases: plot.fsets
### Keywords: models robust multivariate

### ** Examples

d <- lcut3(slices(0, 1, 1000), name='x')

# plot the resulting fuzzy sets
plot(d)

# Additional arguments are passed to the ts.plot method
# Here thick lines represent atomic linguistic expressions,
# i.e. ``small'', ``medium'', and ``big''.
plot(d,
     ylab='membership degree',
     xlab='values', 
     gpars=list(lwd=c(5, rep(1, 7), 5, rep(1, 4), 5, rep(1, 7))))



