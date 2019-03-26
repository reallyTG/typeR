library(signal)


### Name: kaiserord
### Title: Parameters for an FIR filter from a Kaiser window
### Aliases: kaiserord
### Keywords: math

### ** Examples

Fs <- 11025
op <- par(mfrow = c(2, 2), mar = c(3, 3, 1, 1))
for (i in 1:4) {
  switch(i,
    "1" = {
        bands <- c(1200, 1500)
        mag <- c(1, 0)
        dev <- c(0.1, 0.1)
    },
    "2" = {
        bands <- c(1000, 1500)
        mag <- c(0, 1)
        dev <- c(0.1, 0.1)
    },
    "3" = {
        bands <- c(1000, 1200, 3000, 3500)
        mag <- c(0, 1, 0)
        dev <- 0.1
    },
    "4" = {
        bands <- 100 * c(10, 13, 15, 20, 30, 33, 35, 40)
        mag <- c(1, 0, 1, 0, 1)
        dev <- 0.05
    })
}

  kaisprm <- kaiserord(bands, mag, dev, Fs)
  with(kaisprm, {
    d <<- max(1, trunc(n/10))
    if (mag[length(mag)]==1 && (d %% 2) == 1)
      d <<- d+1
    f1 <<- freqz(fir1(n, Wc, type, kaiser(n+1, beta), 'noscale'), 
        Fs = Fs)
    f2 <<- freqz(fir1(n-d, Wc, type, kaiser(n-d+1, beta), 'noscale'), 
        Fs = Fs)
  })                                                               
  plot(f1$f,abs(f1$h), col = "blue", type = "l", 
       xlab = "", ylab = "")
  lines(f2$f,abs(f2$h), col = "red")
  legend("right", paste("order", c(kaisprm$n-d, kaisprm$n)), 
         col = c("red", "blue"), lty = 1, bty = "n")
  b <- c(0, bands, Fs/2)
  for (i in seq(2, length(b), by=2)) {
    hi <- mag[i/2] + dev[1]
    lo <- max(mag[i/2] - dev[1], 0)
    lines(c(b[i-1], b[i], b[i], b[i-1], b[i-1]), c(hi, hi, lo, lo, hi))
  }
par(op)



