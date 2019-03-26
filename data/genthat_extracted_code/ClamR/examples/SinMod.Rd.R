library(ClamR)


### Name: SinMod
### Title: Sine Model of climate time series
### Aliases: SinMod
### Keywords: misc

### ** Examples

data(CLAM1)
x = CLAM1$x
y = CLAM1$y
 dx = 3.392

A1 = proxyA(x, y, dx)

RMSout = SinMod(A1$par, x, y)




