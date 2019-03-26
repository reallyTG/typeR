library(LSAfun)


### Name: plot_neighbors
### Title: 2D- or 3D-Plot of neighbors
### Aliases: plot_neighbors

### ** Examples
data(wonderland)

## Standard Plot
plot_neighbors("cheshire",n=20,tvectors=wonderland)  

## Pretty Plot
plot_neighbors("cheshire",n=20,tvectors=wonderland,
                connect.lines="all",col="rainbow")  



plot_neighbors(compose("mad","hatter",tvectors=wonderland),
                n=20, connect.lines=2,tvectors=wonderland)


