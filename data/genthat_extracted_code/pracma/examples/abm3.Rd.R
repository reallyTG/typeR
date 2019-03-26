library(pracma)


### Name: abm3pc
### Title: Adams-Bashford-Moulton
### Aliases: abm3pc
### Keywords: ode

### ** Examples

##  Attempt on a non-stiff equation
#   y' = y^2 - y^3, y(0) = d, 0 <= t <= 2/d, d = 0.01
f <- function(t, y) y^2 - y^3
d <- 1/250
abm1 <- abm3pc(f, 0, 2/d, d, n = 1/d)
abm2 <- abm3pc(f, 0, 2/d, d, n = 2/d)
## Not run: 
##D plot(abm1$x, abm1$y, type = "l", col = "blue")
##D lines(abm2$x, abm2$y, type = "l", col = "red")
##D grid()
## End(Not run)



