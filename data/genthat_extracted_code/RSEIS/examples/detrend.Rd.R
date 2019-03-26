library(RSEIS)


### Name: detrend
### Title: Remove trend from time series signal
### Aliases: detrend
### Keywords: misc

### ** Examples


dt <- 0.001

 t <- seq(0, 6, by=0.001)


y <- 5*sin(2*pi*10*t)

plot(t,y, type='l')

y <- y  + 3 * t
plot(t,y, type='l')


dy <- detrend(y)

plot(t,dy, type='l')




