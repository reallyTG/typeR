library(bliss)


### Name: change_grid
### Title: change_grid
### Aliases: change_grid

### ** Examples

grid <- seq(0,1,l=1e1)
new_grid <- seq(0,1,l=1e2)
fct <- 3*grid^2 + sin(grid*2*pi)
plot(grid,fct,type="o",lwd=2,cex=1.5)
lines(new_grid,change_grid(fct,grid,new_grid),type="o",col="red",cex=0.8)



