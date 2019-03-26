library(pracma)


### Name: cranknic
### Title: Crank-Nicolson Method
### Aliases: cranknic
### Keywords: ode

### ** Examples

##  Newton's example
f <- function(x, y) 1 - 3*x + y + x^2 + x*y
sol100  <- cranknic(f, 0, 1, 0, N = 100)
sol1000 <- cranknic(f, 0, 1, 0, N = 1000)

## Not run: 
##D # Euler's forward approach
##D feuler <- function(f, t0, t1, y0, n) {
##D     h <- (t1 - t0)/n;  x <- seq(t0, t1, by = h)
##D     y <- numeric(n+1); y[1] <- y0
##D     for (i in 1:n) y[i+1] <- y[i] + h * f(x[i], y[i])
##D     return(list(x = x, y = y))
##D }
##D 
##D solode <- ode23(f, 0, 1, 0)
##D soleul <- feuler(f, 0, 1, 0, 100)
##D 
##D plot(soleul$x, soleul$y, type = "l", col = "blue", 
##D      xlab = "", ylab = "", main = "Newton's example")
##D lines(solode$t, solode$y, col = "gray", lwd = 3)
##D lines(sol100$t, sol100$y, col = "red")
##D lines(sol1000$t, sol1000$y, col = "green")
##D grid()
##D 
##D ##  System of differential equations
##D # "Herr und Hund"
##D fhh <- function(x, y) {
##D     y1 <- y[1]; y2 <- y[2]
##D     s <- sqrt(y1^2 + y2^2)
##D     dy1 <- 0.5 - 0.5*y1/s
##D     dy2 <- -0.5*y2/s
##D     return(c(dy1, dy2))
##D }
##D 
##D sol <- cranknic(fhh, 0, 60, c(0, 10))
##D plot(sol$y[, 1], sol$y[, 2], type = "l", col = "blue",
##D      xlab = "", ylab = "", main = '"Herr und Hund"')
##D grid()
## End(Not run)



