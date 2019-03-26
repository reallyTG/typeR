library(circular)


### Name: swallows
### Title: Orientation of juvenile barn swallows
### Aliases: swallows
### Keywords: datasets

### ** Examples

data(swallows)

swallows <- split(swallows$heading, swallows$treatment)
swallows <- lapply(swallows, function(x) circular(x, units='degrees', template='geographics'))

plot(swallows[[1]])
points(swallows[[2]], col=2)
legend('topright', legend=c('control', 'shifted'), pch=c(19,19), col=c(1,2))



