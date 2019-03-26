library(invLT)


### Name: iv.opC
### Title: Inverse Laplace Transform
### Aliases: iv.BrC iv.opC iv.opChalf

### ** Examples

tvals <- seq(-pi/2, pi/2, length.out = 7)
sinvals <- vapply(tvals, iv.opC, complex(1), L.FUN = L.sin)
plot(tvals, Re(sinvals), type = "l")



