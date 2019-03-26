library(rrcov3way)


### Name: waterquality
### Title: Water quality data in Wyoming, USA
### Aliases: waterquality
### Keywords: datasets

### ** Examples

data(waterquality)
dim(waterquality)               # [1] 14 12 10
dim(waterquality[,,1])          # [1] 14 12
rownames(waterquality[,,1])     # the 14 wells
colnames(waterquality[,,1])     # the 12 chemical compositions
dim(waterquality[,1,])          # [1] 14 10
colnames(waterquality[,1,])     # the ten occasions

(res <- Tucker3(waterquality, robust=FALSE, ilr=TRUE))

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



