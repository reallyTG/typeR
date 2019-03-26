library(signal)


### Name: ellip
### Title: Elliptic or Cauer filter
### Aliases: ellip ellip.default ellip.FilterOfOrder
### Keywords: math

### ** Examples

  # compare the frequency responses of 5th-order Butterworth and elliptic filters.
  bf <- butter(5, 0.1)
  ef <- ellip(5, 3, 40, 0.1)
  bfr <- freqz(bf)
  efr <- freqz(ef)
  plot(bfr$f, 20 * log10(abs(bfr$h)), type = "l", ylim = c(-50, 0),
       xlab = "Frequency, radians", ylab = c("dB"))
  lines(efr$f, 20 * log10(abs(efr$h)), col = "red")



