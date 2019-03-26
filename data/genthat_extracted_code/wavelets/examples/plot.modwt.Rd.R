library(wavelets)


### Name: plot.modwt
### Title: Plot MODWT Coefficients
### Aliases: plot.modwt
### Keywords: ts

### ** Examples

X <- rnorm(2048)
modwtobj <- modwt(X)

# Plotting wavelet coefficients at levels 1 through 6 and scaling
# coefficients at level 6.
plot.modwt(modwtobj, levels = 6)

# Plotting wavelet coefficients of levels 1, 3, 5, and scaling
# coefficients of levels 4 and 5, and green boundary coefficients
# lines.
plot.modwt(modwtobj, levels = list(c(1,3,5),c(4,5)), draw.boundary =
TRUE, col.boundary = "green")

# Plotting wavelet coefficients at level 1 through 6 and not plotting
# any scaling coefficients.
plot.modwt(modwtobj, levels = 6, plot.V = FALSE)



