library(smoothSurv)


### Name: find.c
### Title: Work Function for 'smoothSurvReg'
### Aliases: find.c
### Keywords: internal utilities

### ** Examples

knots <- seq(-4, 4, 0.5)
sd0 <- 0.3
ccoef <- find.c(knots, sd0, dist = "dstlogis")

### We plot the approximation together with the truth
###
grid <- seq(-4, 4, 0.05)
truth <- dstlogis(grid)

### Following lines compute the values of the approximation
grid.big <- matrix(grid, nrow = length(grid), ncol = length(knots))
knots.big <- matrix(knots, nrow = length(grid), ncol = length(knots), byrow = TRUE)
normals <- dnorm(grid.big, mean = knots.big, sd = sd0)
approx <- normals %*% ccoef

### Plot it
plot(grid, approx, type = "l", xlab = "y", ylab = "f(y)", bty = "n")
lines(grid, truth, lty = 2)
legend(-4, 0.35, c("approx", "truth"), lty = 1:2, bty = "n")



