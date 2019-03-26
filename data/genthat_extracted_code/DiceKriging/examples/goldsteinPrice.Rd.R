library(DiceKriging)


### Name: goldsteinPrice
### Title: 2D test function
### Aliases: goldsteinPrice
### Keywords: optimize internal

### ** Examples
 
n.grid <- 20
x.grid <- y.grid <- seq(0,1,length=n.grid)
design.grid <- expand.grid(x.grid, y.grid)
response.grid <- apply(design.grid, 1, goldsteinPrice)
z.grid <- matrix(response.grid, n.grid, n.grid)
contour(x.grid, y.grid, z.grid, 40)
x1 = c(0.5, 0.25)
points(t(x1), pch=19, col="red")
title("Fonction de Goldstein price")



