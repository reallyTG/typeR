library(TDA)


### Name: bootstrapDiagram
### Title: Bootstrapped Confidence Set for a Persistence Diagram, using the
###   Bottleneck Distance (or the Wasserstein distance).
### Aliases: bootstrapDiagram
### Keywords: nonparametric htest

### ** Examples

## confidence set for the Kernel Density Diagram

# input data
n <- 400
XX <- circleUnif(n)

## Ranges of the grid
Xlim <- c(-1.8, 1.8)
Ylim <- c(-1.6, 1.6)
lim <- cbind(Xlim, Ylim)
by <- 0.05

h <- .3  #bandwidth for the function kde

#Kernel Density Diagram of the superlevel sets
Diag <- gridDiag(XX, kde, lim = lim, by = by, sublevel = FALSE,
                 printProgress = TRUE, h = h) 

# confidence set
B <- 10       ## the number of bootstrap iterations should be higher!
              ## this is just an example
alpha <- 0.05

cc <- bootstrapDiagram(XX, kde, lim = lim, by = by, sublevel = FALSE, B = B,
          alpha = alpha, dimension = 1, printProgress = TRUE, h = h)

plot(Diag[["diagram"]], band = 2 * cc)



