library(iopsych)


### Name: relWt
### Title: Relative weights
### Aliases: relWt

### ** Examples

Rs <- matrix(c(1.0, 0.2,  0.3, 0.4, -0.4,
               0.2, 1.0,  0.5, 0.1,  0.1,
               0.3, 0.5,  1.0, 0.2, -0.3,
               0.4, 0.1,  0.2, 1.0,  0.4,
              -0.4, 0.1, -0.3, 0.4,  1.0), 5, 5)
ys <- 5
xs <- 1:4

relWt(Rs, ys, xs)



