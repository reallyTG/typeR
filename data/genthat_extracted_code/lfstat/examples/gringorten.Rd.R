library(lfstat)


### Name: gringorten
### Title: Gringorten Plotting Positions
### Aliases: gringorten
### Keywords: low-flow

### ** Examples

y <- rnorm(10)
pp <- gringorten(y)
pp

plot(pp ~ y, ylim = c(0, 1))



