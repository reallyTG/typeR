library(palinsol)


### Name: astro
### Title: Compute astronomical parameters in the past or in the future
### Aliases: astro ber78 ber90 la04 precession obliquity
### Keywords: misc

### ** Examples


## compare the obliquity over the last 2 Myr with the three solutions

times <- seq(-2e6,0,1e3)
Obl <- function(t) {c(time=t,ber78=ber78(t)['eps'],
       ber90=ber90(t)['eps'], la04=la04(t)['eps'])}

Obls <- data.frame(t(sapply(times,Obl)))
## may take about 10 seconds to run
with(Obls, {
  plot(times/1e3, ber78.eps, type='l', xlab='time (kyr)', 
                                       ylab='Obliquity (radians)')  
  lines(times/1e3, ber90.eps, type='l', col='red')  
  lines(times/1e3, la04.eps, type='l', col='green')  
  })

legend('topright', c('ber78','ber90','la04'), col=c('black','red','green'), lty=1)

## same but with a zoom over the last 300 000 years:

T <- which (times > -3e5)
with(Obls, {
  plot(times[T]/1e3, ber78.eps[T], type='l', xlab='time (kyr)', 
                                       ylab='Obliquity (radians)')  
  lines(times[T]/1e3, ber90.eps[T], type='l', col='red')  
  lines(times[T]/1e3, la04.eps[T], type='l', col='green')  
  })

legend('topright', c('ber78','ber90','la04'), col=c('black','red','green'), lty=1)







