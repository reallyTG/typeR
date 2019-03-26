library(pdSpecEst)


### Name: pdNeville
### Title: Polynomial interpolation of curves (1D) or surfaces (2D) of HPD
###   matrices
### Aliases: pdNeville

### ** Examples

### Polynomial curve interpolation
P <- rExamples1D(50, example = 'gaussian')$f[, , 10*(1:5)]
P.poly <- pdNeville(P, (1:5)/5, (1:50)/50)
## Examine matrix-component (1,1)
plot((1:50)/50, Re(P.poly[1, 1, ]), type = "l") ## interpolated polynomial
lines((1:5)/5, Re(P[1, 1, ]), col = 2) ## control points

### Polynomial surface interpolation
P.surf <- array(P[, , 1:4], dim = c(2,2,2,2)) ## control points
P.poly <- pdNeville(P.surf, list(x = c(0, 1), y = c(0, 1)), list(x = (0:10)/10, y = (0:10)/10))




