library(palinsol)


### Name: Insol
### Title: Computes incoming solar radiation (insolation)
### Aliases: Insol
### Keywords: misc

### ** Examples


## make a little wrapper, with all default values

insolation <- function(times, astrosol=ber78,...)
  sapply(times, function(tt) Insol(orbit=astrosol(tt)))

tts <- seq(from = -400e3, to = 0, by = 1e3)
isl <- insolation(tts, ber78)
plot(tts, isl, typ='l')




