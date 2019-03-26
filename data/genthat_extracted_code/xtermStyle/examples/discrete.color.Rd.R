library(xtermStyle)


### Name: discrete.color
### Title: Map numbers onto a palette
### Aliases: discrete.color

### ** Examples

error.rates <- .6*runif(10)
for(q in error.rates)
  style(q, "\n", fg=discrete.color(q, c(0, .5), "GnRd"))



