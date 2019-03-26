library(pracma)


### Name: rkf54
### Title: Runge-Kutta-Fehlberg
### Aliases: rkf54
### Keywords: ode

### ** Examples

# Example: y' = 1 + y^2
f1 <- function(x, y)  1 + y^2
sol11 <- rkf54(f1, 0, 1.1, 0.5, control = list(hmin = 0.01))
sol12 <- rkf54(f1, 0, 1.1, 0.5, control = list(jmax =  250))

# Riccati equation: y' = x^2 + y^2
f2 <- function(x, y)  x^2 + y^2
sol21 <- rkf54(f2, 0, 1.5, 0.5, control = list(hmin = 0.01))
sol22 <- rkf54(f2, 0, 1.5, 0.5, control = list(jmax =  250))

## Not run: 
##D plot(0, 0, type = "n", xlim = c(0, 1.5), ylim = c(0, 20),
##D      main = "Riccati", xlab = "", ylab = "")
##D points(sol11$x, sol11$y, pch = "*", col = "darkgreen")
##D lines(sol12$x, sol12$y)
##D points(sol21$x, sol21$y, pch = "*", col = "blue")
##D lines(sol22$x, sol22$y)
##D grid()
## End(Not run)



