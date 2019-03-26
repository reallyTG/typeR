library(mvcwt)


### Name: Morlet
### Title: The Morlet function
### Aliases: Morlet
### Keywords: wavelets

### ** Examples

x = seq(-pi, pi, len = 256)
plot(x, Re(Morlet(x)), col = "darkblue", type = "l")
lines(x, Im(Morlet(x)), col = "darkred")
lines(range(x), rep(0, 2), lty = 2)



