library(signal)


### Name: freqs
### Title: s-plane frequency response
### Aliases: freqs freqs.default freqs.Arma freqs.Ma plot.freqs print.freqs
###   freqs_plot freqs_plot.default freqs_plot.freqs
### Keywords: math

### ** Examples

b <- c(1, 2)
a <- c(1, 1)
w <- seq(0, 4, length=128)
freqs(b, a, w)



