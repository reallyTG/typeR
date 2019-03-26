library(RSEIS)


### Name: envelope
### Title: Envelope Function with Hilbert Transform
### Aliases: envelope
### Keywords: misc

### ** Examples


data(CE1)
ev <- envelope(CE1$y)
plot(CE1$x, CE1$y, type='l')
lines(CE1$x,ev, col='red')





