library(DiceKriging)


### Name: branin
### Title: 2D test function
### Aliases: branin
### Keywords: optimize internal

### ** Examples
 
n.grid <- 20
x.grid <- y.grid <- seq(0,1,length=n.grid)
design.grid <- expand.grid(x.grid, y.grid)
response.grid <- apply(design.grid, 1, branin)
z.grid <- matrix(response.grid, n.grid, n.grid)
contour(x.grid,y.grid,z.grid,40)
x1 = c(0.9616520, 0.15); x2 = c(0.1238946, 0.8166644); x3 = c(0.5427730, 0.15)
points(rbind(t(x1), t(x2), t(x3)), pch=19, col="red")
title("Fonction de Branin")



