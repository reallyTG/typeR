library(GA)


### Name: gaisl
### Title: Islands Genetic Algorithms
### Aliases: gaisl show,gaisl-method print,gaisl-method
### Keywords: optimize

### ** Examples

## Not run: 
##D # two-dimensional Rastrigin function
##D Rastrigin <- function(x1, x2)
##D {
##D   20 + x1^2 + x2^2 - 10*(cos(2*pi*x1) + cos(2*pi*x2))
##D }
##D 
##D x1 <- x2 <- seq(-5.12, 5.12, by = 0.1)
##D f <- outer(x1, x2, Rastrigin)
##D persp3D(x1, x2, f, theta = 50, phi = 20)
##D filled.contour(x1, x2, f, color.palette = jet.colors)
##D 
##D GA <- gaisl(type = "real-valued", 
##D             fitness =  function(x) -Rastrigin(x[1], x[2]),
##D             lower = c(-5.12, -5.12), upper = c(5.12, 5.12), 
##D             popSize = 80, maxiter = 500, 
##D             numIslands = 4, migrationInterval = 50)
##D summary(GA)
##D plot(GA)
## End(Not run)



