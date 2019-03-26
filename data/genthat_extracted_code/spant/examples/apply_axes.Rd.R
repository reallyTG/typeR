library(spant)


### Name: apply_axes
### Title: Apply a function over specified array axes.
### Aliases: apply_axes

### ** Examples

z <- array(1:1000, dim = c(10, 10, 10))
a <- apply_axes(z, 3, fft)
a[1,1,] == fft(z[1,1,])
a <- apply_axes(z, 3, sum)
a[1,1,] == sum(z[1,1,])



