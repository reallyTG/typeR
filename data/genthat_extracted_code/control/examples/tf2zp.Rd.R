library(control)


### Name: tf2zp
### Title: Transfer function model conversion to Zero-Pole-Gain model.
### Aliases: tf2zp

### ** Examples

syszp1 <- tf2zp(c(1,1), c(1,2,1))
syszp1
syszp2 <- tf2zp(c(2,2,1), c(1,2,1))
syszp2
unclass(syszp2) # to see list of the zeros,poles and gain as vectors
tf2zp(zp2tf(c(-1,-1), c(-1,-2), 5))



