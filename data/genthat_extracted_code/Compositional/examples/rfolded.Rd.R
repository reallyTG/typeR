library(Compositional)


### Name: Simulation of compositional data from the folded model
### Title: Simulation of compositional data from the folded model
### Aliases: rfolded
### Keywords: random vectors simulation Gaussian mixture models

### ** Examples

s <-  c(0.1490676523, -0.4580818209,  0.0020395316, -0.0047446076, -0.4580818209,
1.5227259250,  0.0002596411,  0.0074836251,  0.0020395316,  0.0002596411,
0.0365384838, -0.0471448849, -0.0047446076,  0.0074836251, -0.0471448849,
0.0611442781)
s <- matrix(s, ncol = 4)
m = c(1.715, 0.914, 0.115, 0.167)
x = rfolded(100, m, s, 0.5)
a.est(x)



