library(R2BayesX)


### Name: plot3d
### Title: 3D Effect Plot
### Aliases: plot3d plotsurf
### Keywords: hplot

### ** Examples

## generate some data
set.seed(111)
n <- 500

## regressors
dat <- data.frame(z = runif(n, -3, 3), w = runif(n, 0, 6))

## response
dat$y <- with(dat, 1.5 + cos(z) * sin(w) + rnorm(n, sd = 0.6))

## Not run: 
##D ## estimate model
##D b <- bayesx(y ~ sx(z, w, bs = "te", knots = 5), data = dat, method = "REML")
##D summary(b)
##D 
##D ## plot estimated effect
##D plot(b, term = "sx(z,w)")
##D 
##D ## extract fitted effects
##D f <- fitted(b, term = "sx(z,w)")
##D 
##D ## now use plot3d
##D plot3d(f)
##D plot3d(f, swap = TRUE)
##D plot3d(f, residuals = TRUE)
##D plot3d(f, resid = TRUE, cex.resid = 0.1)
##D plot3d(f, resid = TRUE, pch = 2, col.resid = "green3")
##D plot3d(f, resid = TRUE, c.select = 95, cex.resid = 0.1)
##D plot3d(f, resid = TRUE, c.select = 80, cex.resid = 0.1)
##D plot3d(f, grid = 100, border = NA)
##D plot3d(f, c.select = 95, border = c("red", NA, "green"),
##D   col.surface = c(1, NA, 1), resid = TRUE, cex.resid = 0.2)
##D 
##D ## now some image and contour
##D plot3d(f, image = TRUE, legend = FALSE)
##D plot3d(f, image = TRUE, legend = TRUE)
##D plot3d(f, image = TRUE, contour = TRUE)
##D plot3d(f, image = TRUE, contour = TRUE, swap = TRUE)
##D plot3d(f, image = TRUE, contour = TRUE, col.contour = "white")
##D plot3d(f, contour = TRUE)
##D op <- par(no.readonly = TRUE)
##D par(mfrow = c(1, 3))
##D plot3d(f, image = TRUE, contour = TRUE, c.select = 3)
##D plot3d(f, image = TRUE, contour = TRUE, c.select = "Estimate")
##D plot3d(f, image = TRUE, contour = TRUE, c.select = "97.5##D 
##D par(op)
## End(Not run)

## another variation
dat$f1 <- with(dat, sin(z) * cos(w))
with(dat, plot3d(cbind(z, w, f1)))

## same with formula 
plot3d(sin(z) * cos(w) ~ z + w, zlab = "f(z,w)", data = dat)
plot3d(sin(z) * cos(w) ~ z + w, zlab = "f(z,w)", data = dat, 
  ticktype = "detailed")

## play with palettes
plot3d(sin(z) * cos(w) ~ z + w, col.surface = heat.colors, data = dat)
plot3d(sin(z) * cos(w) ~ z + w, col.surface = topo.colors, data = dat)
plot3d(sin(z) * cos(w) ~ z + w, col.surface = cm.colors, data = dat)
plot3d(sin(z) * cos(w) ~ z + w, col.surface = rainbow, data = dat)
plot3d(sin(z) * cos(w) ~ z + w, col.surface = terrain.colors, data = dat)

plot3d(sin(z) * cos(w) ~ z + w, col.surface = rainbow_hcl, data = dat)
plot3d(sin(z) * cos(w) ~ z + w, col.surface = diverge_hcl, data = dat)
plot3d(sin(z) * cos(w) ~ z + w, col.surface = sequential_hcl, data = dat)

plot3d(sin(z) * cos(w) ~ z + w, 
  col.surface = rainbow_hcl(n = 99, c = 300, l = 80, start = 0, end = 100), 
  data = dat)
plot3d(sin(z) * cos(w) ~ z + w, 
  col.surface = rainbow_hcl(n = 99, c = 300, l = 80, start = 0, end = 100), 
  image = TRUE, grid = 200, data = dat)



