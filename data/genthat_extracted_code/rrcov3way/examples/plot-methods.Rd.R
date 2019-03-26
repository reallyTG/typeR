library(rrcov3way)


### Name: plot.tucker3
### Title: Plot a tucker3 object
### Aliases: plot.tucker3 plot.parafac
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

## Use rarray to turn back to a 3-way array
##
X <- rarray(BusN, 7, 5, 37)
dimnames(X) <- list(dimnames(Bus)[[1]], c("L-Occ", "P-Occ", "Q-Occ", 
    "S-Occ", "R-Occ"), paste("V",1:37,sep=""))

## Perform classical Tucker3 (nor robust option and no 
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





