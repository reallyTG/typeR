library(pracma)


### Name: triquad
### Title: Gaussian Triangle Quadrature
### Aliases: triquad
### Keywords: math

### ** Examples

x <- c(-1, 1, 0); y <- c(0, 0, 1)
f1 <- function(x, y) x^2 + y^2
(I <- triquad(f1, x, y))                        # 0.3333333333333333

# split the unit square
x1 <- c(0, 1, 1); y1 <- c(0, 0, 1)
x2 <- c(0, 1, 0); y2 <- c(0, 1, 1)
f2 <- function(x, y) exp(x + y)
I <- triquad(f2, x1, y1) + triquad(f2, x2, y2)  # 2.952492442012557
quad2d(f2, 0, 1, 0, 1)                          # 2.952492442012561
simpson2d(f2, 0, 1, 0, 1)                       # 2.952492442134769
dblquad(f2,  0, 1, 0, 1)                        # 2.95249244201256



