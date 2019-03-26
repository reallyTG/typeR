library(RcppDynProg)


### Name: piecewise_constant_coder
### Title: Piecewise constant fit coder factory.
### Aliases: piecewise_constant_coder

### ** Examples


coder <- piecewise_constant_coder(min_seg = 1)
coder("x", 1:8, c(-1, -1, -1, -1, 1, 1, 1, 1))




