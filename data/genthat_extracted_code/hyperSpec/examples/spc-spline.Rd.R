library(hyperSpec)


### Name: spc.smooth.spline
### Title: Spectral smoothing by splines
### Aliases: spc.smooth.spline

### ** Examples

p <- paracetamol [,,2200 ~ max]
plot (p, col = "gray")
smooth <- spc.smooth.spline (p [,, c (2200 ~ 2400, 2500 ~ 2825, 3150 ~ max)],
                             wl (paracetamol [,, 2200 ~ max]),
                             df = 4, spar = 1)
plot (smooth, col = "red", add = TRUE)

plot (p - smooth)




