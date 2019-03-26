library(sde)


### Name: quotes
### Title: Daily closings of 20 financial time series from 2006-01-03 to
###   2007-12-31
### Aliases: quotes
### Keywords: datasets

### ** Examples

data(quotes)

plot(quotes)

d <- MOdist(quotes)
cl <- hclust( d )
groups <- cutree(cl, k=4)

cmd <- cmdscale(d)
plot( cmd, col=groups)
text( cmd, labels(d) , col=groups)

plot(quotes, col=groups)

plot(quotes, col=groups,ylim=range(quotes))



