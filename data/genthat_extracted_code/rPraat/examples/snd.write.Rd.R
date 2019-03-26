library(rPraat)


### Name: snd.write
### Title: snd.write
### Aliases: snd.write

### ** Examples

## Not run: 
##D snd <- snd.sample()
##D snd.plot(snd)
##D snd.write(snd, "temp1.wav")
##D 
##D signal <- 0.8*sin(seq(0, 2*pi*440, length.out = 8000))
##D snd.write(list(sig = signal, fs = 8000, nBits = 16), "temp2.wav")
##D 
##D left  <- 0.3*sin(seq(0, 2*pi*440, length.out = 4000))
##D rigth <- 0.5*sin(seq(0, 2*pi*220, length.out = 4000))
##D snd.write(list(sig = matrix(c(left, right), ncol = 2), fs = 8000, nBits = 16), "temp3.wav")
## End(Not run)



