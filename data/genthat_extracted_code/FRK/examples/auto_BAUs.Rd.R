library(FRK)


### Name: auto_BAUs
### Title: Automatic BAU generation
### Aliases: auto_BAUs

### ** Examples

## First a 1D example
library(sp)
set.seed(1)
data <- data.frame(x = runif(10)*10, y = 0, z= runif(10)*10)
coordinates(data) <- ~x+y
Grid1D_df <- auto_BAUs(manifold = real_line(),
                       cellsize = 1,
                       data=data)
## Not run: spplot(Grid1D_df)

## Now a 2D example
data(meuse)
coordinates(meuse) = ~x+y # change into an sp object

## Grid BAUs
GridPols_df <- auto_BAUs(manifold = plane(),
                         cellsize = 200,
                         type = "grid",
                         data = meuse,
                         nonconvex_hull = 0)
## Not run: plot(GridPols_df)

## Hex BAUs
HexPols_df <- auto_BAUs(manifold = plane(),
                        cellsize = 200,
                        type = "hex",
                        data = meuse,
                        nonconvex_hull = 0)
## Not run: plot(HexPols_df)



