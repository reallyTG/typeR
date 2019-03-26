library(inlmisc)


### Name: GetColors
### Title: Get Palette Colors
### Aliases: GetColors
### Keywords: color

### ** Examples

pal <- GetColors(n = 10)
print(pal)
plot(pal)

Pal <- GetColors(scheme = "DEM screen", alpha = 0.9)
filled.contour(datasets::volcano, color.palette = Pal)

# Diverging color schemes (scheme)
op <- par(mfrow = c(6, 1), oma = c(0, 0, 0, 0))
plot(GetColors(  9, scheme = "BuRd"))
plot(GetColors(255, scheme = "BuRd"))
plot(GetColors(  9, scheme = "PRGn"))
plot(GetColors(255, scheme = "PRGn"))
plot(GetColors( 11, scheme = "sunset"))
plot(GetColors(255, scheme = "sunset"))
par(op)

# Qualitative color schemes (scheme)
op <- par(mfrow = c(7, 1), oma = c(0, 0, 0, 0))
plot(GetColors(7, scheme = "bright"))
plot(GetColors(6, scheme = "dark"))
plot(GetColors(5, scheme = "high-contrast"))
plot(GetColors(9, scheme = "light"))
plot(GetColors(9, scheme = "muted"))
plot(GetColors(6, scheme = "pale"))
plot(GetColors(7, scheme = "vibrant"))
par(op)

# Sequential color schemes (scheme)
op <- par(mfrow = c(7, 1), oma = c(0, 0, 0, 0))
plot(GetColors( 23, scheme = "discrete rainbow"))
plot(GetColors( 34, scheme = "smooth rainbow"))
plot(GetColors(255, scheme = "smooth rainbow"))
plot(GetColors(  9, scheme = "YlOrBr"))
plot(GetColors(255, scheme = "YlOrBr"))
plot(GetColors( 23, scheme = "iridescent"))
plot(GetColors(255, scheme = "iridescent"))
par(op)

# Alpha transparency (alpha)
op <- par(mfrow = c(5, 1), oma = c(0, 0, 0, 0))
plot(GetColors(34, alpha = 1.0))
plot(GetColors(34, alpha = 0.8))
plot(GetColors(34, alpha = 0.6))
plot(GetColors(34, alpha = 0.4))
plot(GetColors(34, alpha = 0.2))
par(op)

# Color stops (stops)
op <- par(mfrow = c(4, 1), oma = c(0, 0, 0, 0))
plot(GetColors(255, stops = c(0.0, 1.0)))
plot(GetColors(255, stops = c(0.0, 0.5)))
plot(GetColors(255, stops = c(0.5, 1.0)))
plot(GetColors(255, stops = c(0.3, 0.9)))
par(op)

# Interpolation bias (bias)
op <- par(mfrow = c(7, 1), oma = c(0, 0, 0, 0))
plot(GetColors(255, bias = 0.4))
plot(GetColors(255, bias = 0.6))
plot(GetColors(255, bias = 0.8))
plot(GetColors(255, bias = 1.0))
plot(GetColors(255, bias = 1.2))
plot(GetColors(255, bias = 1.4))
plot(GetColors(255, bias = 1.6))
par(op)

# Reverse colors (reverse)
op <- par(mfrow = c(2, 1), oma = c(0, 0, 0, 0), cex = 0.7)
plot(GetColors(10, reverse = FALSE))
plot(GetColors(10, reverse = TRUE))
par(op)

# Color blindness (blind)
op <- par(mfrow = c(5, 1), oma = c(0, 0, 0, 0))
plot(GetColors(34, blind = NULL))
plot(GetColors(34, blind = "deutan"))
plot(GetColors(34, blind = "protan"))
plot(GetColors(34, blind = "tritan"))
plot(GetColors(34, blind = "monochrome"))
par(op)

# Gray-scale preparation (gray)
op <- par(mfrow = c(8, 1), oma = c(0, 0, 0, 0))
plot(GetColors(3, "bright",        gray = TRUE))
plot(GetColors(3, "bright",        gray = TRUE, blind = "monochrome"))
plot(GetColors(5, "high-contrast", gray = TRUE))
plot(GetColors(5, "high-contrast", gray = TRUE, blind = "monochrome"))
plot(GetColors(4, "vibrant",       gray = TRUE))
plot(GetColors(4, "vibrant",       gray = TRUE, blind = "monochrome"))
plot(GetColors(5, "muted",         gray = TRUE))
plot(GetColors(5, "muted",         gray = TRUE, blind = "monochrome"))
par(op)




