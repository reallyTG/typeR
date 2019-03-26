library(pracma)


### Name: horner
### Title: Horner's Rule
### Aliases: horner hornerdefl
### Keywords: math

### ** Examples

x <- c(-2, -1, 0, 1, 2)
p <- c(1, 0, 1)  # polynomial x^2 + x, derivative 2*x
horner(p, x)$y   #=>  5  2  1  2  5
horner(p, x)$dy  #=> -4 -2  0  2  4

p <- Poly(c(1, 2, 3))  # roots 1, 2, 3
hornerdefl(p, 3)          # q = x^2- 3 x + 2  with roots 1, 2



