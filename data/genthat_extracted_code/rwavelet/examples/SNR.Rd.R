library(rwavelet)


### Name: SNR
### Title: Signal/Noise ratio
### Aliases: SNR

### ** Examples

n <- 2^4
x <- MakeSignal('HeaviSine', n)
y <- x + rnorm(n, mean=0, sd=1)
SNR(x, y)



