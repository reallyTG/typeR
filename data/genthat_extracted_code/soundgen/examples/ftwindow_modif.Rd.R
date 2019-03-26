library(soundgen)


### Name: ftwindow_modif
### Title: Fourier transform windows (seewave)
### Aliases: ftwindow_modif
### Keywords: internal

### ** Examples

wns = c('bartlett', 'blackman', 'flattop', 'hamming', 'hanning', 'rectangle', 'gaussian')
l = 200
par(mfrow = c(4, 2))
for (w in wns) {
  plot(1:l, soundgen:::ftwindow_modif(wl = l, wn = w), type = 'b', main = w)
}
par(mfrow = c(1, 1))



