library(pracma)


### Name: bulirsch-stoer
### Title: Bulirsch-Stoer Algorithm
### Aliases: bulirsch_stoer midpoint
### Keywords: ode

### ** Examples

## Example: y'' = -y
f1 <- function(t, y) as.matrix(c(y[2], -y[1]))
y0 <- as.matrix(c(0.0, 1.0))
tt <- linspace(0, pi, 13)
yy <- bulirsch_stoer(f1, tt, c(0.0, 1.0))   # 13 equally-spaced grid points
yy[nrow(yy), 1]                             # 1.1e-11

## Not run: 
##D S  <- ode23(f1, 0, pi, c(0.0, 1.0))
##D yy <- bulirsch_stoer(f1, S$t, c(0.0, 1.0))  # S$x 13 irregular grid points
##D yy[nrow(yy), 1]                             #  2.5e-11
##D S$y[nrow(S$y), 1]                           # -7.1e-04
##D 
##D ## Example: y' = -200 x y^2                 # y(x) = 1 / (1 + 100 x^2)
##D f2 <- function(t, y) -200 * t * y^2
##D y0 < 1
##D tic(); S <- ode23(f2, 0, 1, y0); toc()            # 0.002 sec
##D tic(); yy <- bulirsch_stoer(f2, S$t, y0); toc()   # 0.013 sec
## End(Not run)



