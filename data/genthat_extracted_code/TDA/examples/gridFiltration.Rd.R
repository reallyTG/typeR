library(TDA)


### Name: gridFiltration
### Title: Persistence Diagram of a function over a Grid
### Aliases: gridFiltration
### Keywords: methods

### ** Examples

# input data
n <- 10
XX <- circleUnif(n)

## Ranges of the grid
Xlim <- c(-1, 1)
Ylim <- c(-1, 1)
lim <- cbind(Xlim, Ylim)
by <- 1

#Distance Function Diagram of the sublevel sets
FltGrid <- gridFiltration(
  XX, distFct, lim = lim, by = by, sublevel = TRUE, printProgress = TRUE) 




