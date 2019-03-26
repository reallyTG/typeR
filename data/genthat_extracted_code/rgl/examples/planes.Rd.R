library(rgl)


### Name: planes3d
### Title: add planes
### Aliases: rgl.planes planes3d rgl.clipplanes clipplanes3d
### Keywords: dynamic

### ** Examples


# Show regression plane with z as dependent variable

open3d()
x <- rnorm(100)
y <- rnorm(100)
z <- 0.2*x - 0.3*y + rnorm(100, sd = 0.3)
fit <- lm(z ~ x + y)
plot3d(x, y, z, type = "s", col = "red", size = 1)

coefs <- coef(fit)
a <- coefs["x"]
b <- coefs["y"]
c <- -1
d <- coefs["(Intercept)"]
planes3d(a, b, c, d, alpha = 0.5)

open3d()
ids <- plot3d(x, y, z, type = "s", col = "red", size = 1, forceClipregion = TRUE) 
oldid <- useSubscene3d(ids["clipregion"])
clipplanes3d(a, b, c, d)
useSubscene3d(oldid)



