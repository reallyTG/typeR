library(biwavelet)


### Name: wt
### Title: Compute wavelet transform
### Aliases: wt

### ** Examples

t1 <- cbind(1:100, rnorm(100))

## Continuous wavelet transform
wt.t1 <- wt(t1)

## Plot power
## Make room to the right for the color bar
par(oma = c(0, 0, 0, 1), mar = c(5, 4, 4, 5) + 0.1)
plot(wt.t1, plot.cb = TRUE, plot.phase = FALSE)




