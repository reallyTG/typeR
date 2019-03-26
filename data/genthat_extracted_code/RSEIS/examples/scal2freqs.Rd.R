library(RSEIS)


### Name: scal2freqs
### Title: Wavelet Frequency Scale
### Aliases: scal2freqs
### Keywords: misc

### ** Examples

noctave <- 6
nvoice <- 20
dt <- 0.004
i1 <- sort(rep(c(1:noctave), times=nvoice))
  jj <- rep(c(0:(nvoice-1)), times=noctave)

  sa <- 2^(i1+jj/nvoice)

  efs <- scal2freqs(sa, dt)







