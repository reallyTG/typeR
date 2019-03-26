library(DiceKriging)


### Name: camelback
### Title: 2D test function
### Aliases: camelback
### Keywords: optimize internal

### ** Examples
 
n.grid <- 20
x.grid <- y.grid <- seq(0,1,length=n.grid)
design.grid <- expand.grid(x.grid, y.grid)
response.grid <- apply(design.grid, 1, camelback)
z.grid <- matrix(response.grid, n.grid, n.grid)
contour(x.grid,y.grid,z.grid,20)
x1 = c(0.5149730,0.3218374); x2 = c(0.4850263,0.6781641)
points(rbind(t(x1), t(x2)), pch=19, col="red")
title("Fonction Camelback")



