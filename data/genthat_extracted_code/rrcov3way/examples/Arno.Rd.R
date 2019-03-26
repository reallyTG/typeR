library(rrcov3way)


### Name: Arno
### Title: Chemical composition of water in the main stream of Arno river
### Aliases: Arno
### Keywords: datasets

### ** Examples

data(Arno)
dim(Arno)               # [1] 23 11  4
dim(Arno[,,1])          # [1] 23 11
rownames(Arno[,,1])     # the 23 distances from the spring
colnames(Arno[,,1])     # the 11 chemical compositions
dim(Arno[,1,])          # [1] 23  4
colnames(Arno[,1,])     # the four occasions

res <- Tucker3(Arno, robust=FALSE, ilr=TRUE)
res

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



