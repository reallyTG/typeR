library(RSEIS)


### Name: genrick
### Title: Ricker Wavelet
### Aliases: genrick
### Keywords: misc

### ** Examples


dt <- 0.01
freq <- 16
nlen <- 35

G <- genrick(freq, dt, nlen)

tee <- seq(from=0, by=dt, length=length(G))

plot(tee, G, type='l')




