library(RSEIS)


### Name: wiggle.env
### Title: Plot time series envelope
### Aliases: wiggle.env
### Keywords: misc

### ** Examples


##  data("CE1.Example.RDATA")
##   load("CE1.Example.RDATA")
data(CE1)
plot(CE1$x, CE1$y, type='l')
wiggle.env(CE1$x, CE1$y)
we = wiggle.env(CE1$x, CE1$y)
lines(we$x, we$y, col='red')




