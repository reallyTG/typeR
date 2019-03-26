library(iopsych)


### Name: rmatReg
### Title: Regression
### Aliases: rmatReg

### ** Examples

Rs <- matrix(c(1.0, 0.2,  0.3, 0.4, -0.4,
              0.2, 1.0,  0.5, 0.1,  0.1,
              0.3, 0.5,  1.0, 0.2, -0.3,
              0.4, 0.1,  0.2, 1.0,  0.4,
             -0.4, 0.1, -0.3, 0.4,  1.0), 5, 5)
ys <- 5
xs <- 1:4

rmatReg(Rs, ys, xs)



