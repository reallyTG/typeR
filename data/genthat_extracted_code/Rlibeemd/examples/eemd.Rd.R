library(Rlibeemd)


### Name: eemd
### Title: EEMD Decomposition
### Aliases: eemd

### ** Examples

x <- seq(0, 2*pi, length.out = 500)
signal <- sin(4*x)
intermittent <- 0.1 * sin(80 * x)
y <- signal * (1 + ifelse(signal > 0.7, intermittent, 0))

plot(x = x,y = y,type = "l")
# Decompose with EEMD
imfs <- eemd(y, num_siftings = 10, ensemble_size = 50, threads = 1)
 
plot(imfs)
# High frequencies
ts.plot(rowSums(imfs[, 1:3]))
# Low frequencies
ts.plot(rowSums(imfs[, 4:ncol(imfs)]))



