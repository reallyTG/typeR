library(tframe)


### Name: tfwindow
### Title: Truncate a Time Series
### Aliases: tfwindow tfwindow.default tfwindow.ts tfwindow.tframe
### Keywords: programming utilities ts chron

### ** Examples

  z <- ts(matrix(rnorm(24),24,1), start=c(1980,1), frequency=4)
  zz <- tfwindow(z, start=c(1982,2))
  zzz <- matrix(rnorm(24),24,1)
  tframe(zzz) <- tframe(z)
  tfwindow(zzz, tf=tframe(zz))



