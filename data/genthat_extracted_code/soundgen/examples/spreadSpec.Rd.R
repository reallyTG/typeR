library(soundgen)


### Name: spreadSpec
### Title: Spread spectrum
### Aliases: spreadSpec
### Keywords: internal

### ** Examples

barkSpec = c(rep(0, 10), 20000, 2e5, 2e4, 1e4, 2000, rep(0, 8))
plot(soundgen:::spreadSpec(barkSpec), type = 'b', col = 'red')
points(barkSpec, type = 'b', col = 'blue')



