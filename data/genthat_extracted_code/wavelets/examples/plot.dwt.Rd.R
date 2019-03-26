library(wavelets)


### Name: plot.dwt
### Title: Plot DWT Coefficients
### Aliases: plot.dwt
### Keywords: ts

### ** Examples

X <- rnorm(2048)
dwtobj <- dwt(X)

# Plotting wavelet coefficients of levels 1 through 6 and scaling
# coefficients of level 6.
plot.dwt(dwtobj, levels = 6)

# Plotting wavelet coefficients of levels 1, 3, 5, and scaling
# coefficients of levels 4 and 5, and green boundary coefficient lines.
plot.dwt(dwtobj, levels = list(c(1,3,5),c(4,5)), draw.boundary = TRUE,
col.boundary = "green")

# Plotting wavelet coefficients of level 1 through 6 and not plotting
# any scaling coefficients.
plot.dwt(dwtobj, levels = 6, plot.V = FALSE)



