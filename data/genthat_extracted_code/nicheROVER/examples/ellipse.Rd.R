library(nicheROVER)


### Name: ellipse
### Title: Point coordinates for a 2-D ellipse.
### Aliases: ellipse

### ** Examples

mu <- rnorm(2)
V <- crossprod(matrix(rnorm(4), 2, 2))
ell.pts <- ellipse(mu = mu, V = V, alpha = .9, n = 100)
plot(ell.pts, col = rainbow(110)[1:100], type = "o")
points(mu[1], mu[2], pch = "+")



