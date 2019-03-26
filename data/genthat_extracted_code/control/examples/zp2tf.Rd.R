library(control)


### Name: zp2tf
### Title: Zero-pole-gain model conversion to Transfer function model
### Aliases: zp2tf

### ** Examples

systf <- zp2tf(zpk(NULL, c(-1,-1), 1))
zp2tf(tf2zp(c(2,2,1), c(1,2,1)))




