library(mc2d)


### Name: plot.tornado
### Title: Draws a Tornado chart.
### Aliases: plot.tornado plot.tornadounc
### Keywords: hplot

### ** Examples

data(ec)
x <- evalmcmod(ec$modEC2, nsv=100, nsu=100, seed=666)
tor <- tornado(x, 7)
plot(tor)




