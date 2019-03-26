library(signal)


### Name: remez
### Title: Parks-McClellan optimal FIR filter design
### Aliases: remez
### Keywords: math

### ** Examples

f1 <- remez(15, c(0, 0.3, 0.4, 1), c(1, 1, 0, 0))
freqz(f1)



