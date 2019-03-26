library(bamlss)


### Name: plot3d
### Title: Plot 3D Effects
### Aliases: plot3d
### Keywords: hplot

### ** Examples

## Generate some data.
set.seed(111)
n <- 500

## Regressors.
d <- data.frame(z = runif(n, -3, 3), w = runif(n, 0, 6))

## Response.
d$y <- with(d, 1.5 + cos(z) * sin(w) + rnorm(n, sd = 0.6))

## Not run: 
##D ## Estimate model.
##D b <- bamlss(y ~ s(z,w), data = d)
##D summary(b)
##D 
##D ## Plot estimated effect.
##D plot(b, model = "mu", term = "s(z,w)")
##D 
##D ## Extract fitted values.
##D f <- fitted(b, model = "mu", term = "s(z,w)", intercept = FALSE)
##D f <- cbind(d[, c("z", "w")], f)
##D 
##D ## Now use plot3d().
##D plot3d(f)
##D plot3d(f, swap = TRUE)
##D plot3d(f, grid = 100, border = NA)
##D 
##D ## Only works if columns are named with
##D ## '2.5##D 
##D plot3d(f, c.select = 95, border = c("red", NA, "green"),
##D   col.surface = c(1, NA, 1), resid = TRUE, cex.resid = 0.2)
##D 
##D ## Now some image and contour.
##D # plot3d(f, image = TRUE, legend = FALSE)
##D # plot3d(f, image = TRUE, legend = TRUE)
##D # plot3d(f, image = TRUE, contour = TRUE)
##D # plot3d(f, image = TRUE, contour = TRUE, swap = TRUE)
##D # plot3d(f, image = TRUE, contour = TRUE, col.contour = "white")
##D # plot3d(f, contour = TRUE)
##D # plot3d(f, image = TRUE, contour = TRUE, c.select = 3)
##D # plot3d(f, image = TRUE, contour = TRUE, c.select = "Mean")
##D # plot3d(f, image = TRUE, contour = TRUE, c.select = "97.5##D 
## End(Not run)

## Variations.
d$f1 <- with(d, sin(z) * cos(w))
with(d, plot3d(cbind(z, w, f1)))

## Same with formula. 
plot3d(sin(z) * cos(w) ~ z + w, zlab = "f(z,w)", data = d)
plot3d(sin(z) * cos(w) ~ z + w, zlab = "f(z,w)", data = d, 
  ticktype = "detailed")

## Play with palettes.
plot3d(sin(z) * cos(w) ~ z + w, col.surface = heat.colors, data = d)
plot3d(sin(z) * cos(w) ~ z + w, col.surface = topo.colors, data = d)
plot3d(sin(z) * cos(w) ~ z + w, col.surface = cm.colors, data = d)
plot3d(sin(z) * cos(w) ~ z + w, col.surface = rainbow, data = d)
plot3d(sin(z) * cos(w) ~ z + w, col.surface = terrain.colors, data = d)

plot3d(sin(z) * cos(w) ~ z + w, col.surface = rainbow_hcl, data = d)
plot3d(sin(z) * cos(w) ~ z + w, col.surface = diverge_hcl, data = d)
plot3d(sin(z) * cos(w) ~ z + w, col.surface = sequential_hcl, data = d)

plot3d(sin(z) * cos(w) ~ z + w, 
  col.surface = rainbow_hcl(n = 99, c = 300, l = 80, start = 0, end = 100), 
  data = d)
# plot3d(sin(z) * cos(w) ~ z + w, 
#  col.surface = rainbow_hcl(n = 99, c = 300, l = 80, start = 0, end = 100), 
#  image = TRUE, grid = 200, data = d)



