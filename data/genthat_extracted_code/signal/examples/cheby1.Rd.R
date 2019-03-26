library(signal)


### Name: cheby1
### Title: Generate a Chebyshev filter.
### Aliases: cheby1 cheby1.default cheby1.FilterOfOrder cheby2
###   cheby2.default cheby2.FilterOfOrder
### Keywords: math

### ** Examples

  # compare the frequency responses of 5th-order Butterworth and Chebyshev filters.
  bf <- butter(5, 0.1)
  cf <- cheby1(5, 3, 0.1)
  bfr <- freqz(bf)
  cfr <- freqz(cf)
  plot(bfr$f/pi, 20 * log10(abs(bfr$h)), type = "l", ylim = c(-40, 0),
       xlim = c(0, .5), xlab = "Frequency", ylab = c("dB"))
  lines(cfr$f/pi, 20 * log10(abs(cfr$h)), col = "red")
  # compare type I and type II Chebyshev filters.
  c1fr <- freqz(cheby1(5, .5, 0.5))
  c2fr <- freqz(cheby2(5, 20, 0.5))
  plot(c1fr$f/pi, abs(c1fr$h), type = "l", ylim = c(0, 1),
       xlab = "Frequency", ylab = c("Magnitude"))
  lines(c2fr$f/pi, abs(c2fr$h), col = "red")



