library(rrcov3way)


### Name: Tucker3
### Title: Robust Tucker3 estimator for compositional data
### Aliases: Tucker3 print.tucker3
### Keywords: Multivariate Robust

### ** Examples

##
## The Bus data from package ThreeWay
##
data(Bus)       # from ThreeWay: 7x5x37, unfolded to 7x185
dim(Bus)

## Preprocessing
##
max.scale <- c(47, 10, 10, 15, 15)
maxBus <- rep(max.scale, 37)
BusN <- t(t(Bus)/maxBus)

## Use toArray to turn to a 3-way array
##
X <- toArray(BusN, 7, 5, 37)
dimnames(X) <- list(dimnames(Bus)[[1]], 
                    substr(dimnames(Bus)[[2]][1:5], 1, 1), 
                    substr(dimnames(Bus)[[2]][seq(1, ncol(Bus), 5)], 3, 8))
dimnames(X)

## Perform classical Tucker3 (non-robust option and no
##  ilr transformation for compositional data)
res <- Tucker3(X, robust=FALSE, ilr=FALSE)

## Distance-distance plot
plot(res, which="dd", main="Distance-distance plot")

## Paired component plot, mode A
plot(res, which="comp", main="Paired component plot (mode A)")

## Paired component plot, mode B
plot(res, which="comp", mode="B", main="Paired component plot (mode B)")

## Joint biplot
plot(res, which="jbplot", main="Joint biplot")

## Trajectory plot
plot(res, which="tjplot", main="Trajectory biplot")


#############
##
## Example with the UNIDO Manufacturing value added data

data(va3way)
dim(va3way)

## Treat quickly and dirty the zeros in the data set (if any)
va3way[va3way==0] <- 0.001

##
res <- Tucker3(va3way)
res
print(res$fit)
print(res$A)

## Print the core matrix
print(res$GA)

## Distance-distance plot
plot(res, which="dd", main="Distance-distance plot")

## Paired component plot, mode A
plot(res, which="comp", main="Paired component plot (mode A)")

## Paired component plot, mode B
plot(res, which="comp", mode="B", main="Paired component plot (mode B)")

## Joint biplot
plot(res, which="jbplot", main="Joint biplot")

## Trajectory
plot(res, which="tjplot", main="Trajectory biplot")




