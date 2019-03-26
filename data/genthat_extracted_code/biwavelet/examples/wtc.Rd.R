library(biwavelet)


### Name: wtc
### Title: Compute wavelet coherence
### Aliases: wtc

### ** Examples

t1 <- cbind(1:100, rnorm(100))
t2 <- cbind(1:100, rnorm(100))

## Wavelet coherence
wtc.t1t2 <- wtc(t1, t2, nrands = 10)

## Plot wavelet coherence and phase difference (arrows)
## Make room to the right for the color bar
par(oma = c(0, 0, 0, 1), mar = c(5, 4, 4, 5) + 0.1)
plot(wtc.t1t2, plot.cb = TRUE, plot.phase = TRUE)




