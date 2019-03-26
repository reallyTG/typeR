library(inlmisc)


### Name: SetHinge
### Title: Set Hinge Location in Color Palette
### Aliases: SetHinge
### Keywords: color

### ** Examples

Pal <- SetHinge(x = c(-3, 7), hinge = 0)
Plot <- inlmisc:::plot.inlpal
Plot(Pal(n = 20))

x <- datasets::volcano
Pal <- SetHinge(x, hinge = 140, scheme = c("abyss", "dem1"))
filled.contour(x, color.palette = Pal, nlevels = 50)

# Data range (x)
hinge <- 0; n <- 20
op <- par(mfrow = c(5, 1), oma = c(0, 0, 0, 0))
Plot(SetHinge(c(-10,  0), hinge)(n))
Plot(SetHinge(c( -7,  3), hinge)(n))
Plot(SetHinge(c( -5,  5), hinge)(n))
Plot(SetHinge(c( -3,  7), hinge)(n))
Plot(SetHinge(c(  0, 10), hinge)(n))
par(op)

# Hinge value (hinge)
x <- c(-5, 5); n <- 255
op <- par(mfrow = c(5, 1), oma = c(0, 0, 0, 0))
Plot(SetHinge(x, hinge = -6)(n))
Plot(SetHinge(x, hinge = -2)(n))
Plot(SetHinge(x, hinge =  0)(n))
Plot(SetHinge(x, hinge =  2)(n))
Plot(SetHinge(x, hinge =  6)(n))
par(op)

# Color scheme (scheme)
x <- c(-10, 10); hinge <- -3; n <- 255
op <- par(mfrow = c(3, 1), oma = c(0, 0, 0, 0))
Plot(SetHinge(x, hinge, scheme = "oleron")(n))
Plot(SetHinge(x, hinge, scheme = "BuRd")(n))
Plot(SetHinge(x, hinge, scheme = c("ocean", "copper"))(n))
par(op)

# Alpha transparency (alpha)
x <- c(-5, 5); hinge <- 0; scheme <- c("drywet", "hawaii"); n <- 255
op <- par(mfrow = c(4, 1), oma = c(0, 0, 0, 0))
Plot(SetHinge(x, hinge, scheme, alpha = 1.0)(n))
Plot(SetHinge(x, hinge, scheme, alpha = 0.5)(n))
Plot(SetHinge(x, hinge, scheme, alpha = c(1.0, 0.5))(n))
Plot(SetHinge(x, hinge, scheme, alpha = c(0.5, 1.0))(n))
par(op)

# Reverse colors (reverse)
x <- c(-10, 10); hinge <- -3; n <- 255
op <- par(mfrow = c(6, 1), oma = c(0, 0, 0, 0))
Plot(SetHinge(x, hinge, "roma", reverse = FALSE)(n))
Plot(SetHinge(x, hinge, "roma", reverse = TRUE)(n))
Plot(SetHinge(x, hinge, c("davos", "hawaii"), reverse = FALSE)(n))
Plot(SetHinge(x, hinge, c("davos", "hawaii"), reverse = TRUE)(n))
Plot(SetHinge(x, hinge, c("davos", "hawaii"), reverse = c(TRUE, FALSE))(n))
Plot(SetHinge(x, hinge, c("davos", "hawaii"), reverse = c(FALSE, TRUE))(n))
par(op)

# Buffer around hinge (buffer)
x <- c(-5, 5); hinge <- -2; n <- 20
op <- par(mfrow = c(6, 1), oma = c(0, 0, 0, 0))
Plot(SetHinge(x, hinge, buffer = 0.0)(n))
Plot(SetHinge(x, hinge, buffer = 0.2)(n))
Plot(SetHinge(x, hinge, buffer = c(0.4, 0.2))(n))
Plot(SetHinge(x, hinge, c("gray", "plasma"), buffer = 0.0)(n))
Plot(SetHinge(x, hinge, c("gray", "plasma"), buffer = 0.2)(n))
Plot(SetHinge(x, hinge, c("gray", "plasma"), buffer = c(0.2, 0.4))(n))
par(op)

# Color stops (stops)
x <- c(-5, 5); hinge <- 1; n <- 20
op <- par(mfrow = c(6, 1), oma = c(0, 0, 0, 0))
Plot(SetHinge(x, hinge, stops = c(0.0, 1.0))(n))
Plot(SetHinge(x, hinge, stops = c(0.2, 0.8))(n))
Plot(SetHinge(x, hinge, stops = c(0.4, 0.6))(n))
Plot(SetHinge(x, hinge, c("gray", "plasma"), stops = c(0.0, 1.0))(n))
Plot(SetHinge(x, hinge, c("gray", "plasma"), stops = c(0.2, 0.8))(n))
Plot(SetHinge(x, hinge, c("gray", "plasma"), stops = c(0.4, 0.6))(n))
par(op)

# Allow bias (allow_bias)
x <- c(-3, 7); n <- 20
op <- par(mfrow = c(4, 1), oma = c(0, 0, 0, 0))
Plot(SetHinge(x, hinge = 0, allow_bias = TRUE)(n))
Plot(SetHinge(x, hinge = 0, allow_bias = FALSE)(n))
Plot(SetHinge(x, hinge = 4, allow_bias = TRUE)(n))
Plot(SetHinge(x, hinge = 4, allow_bias = FALSE)(n))
par(op)




