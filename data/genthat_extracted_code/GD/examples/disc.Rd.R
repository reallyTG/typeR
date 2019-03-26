library(GD)


### Name: disc
### Title: Generates discretization parameters for continuous data.
### Aliases: disc print.disc plot.disc

### ** Examples

## method is default (quantile); number of intervals is 4
ds1 <- disc(ndvi_40$Tempchange, 4)
ds1
## method is equal; number of intervals is 4
ds2 <- disc(ndvi_40$Tempchange, 4, method = "equal")
## method is manual; number of intervals is 4
manualitv1 <- c(-0.5, 0, 1, 2, 4)
ds3 <- disc(ndvi_40$Tempchange, 4, method = "manual", ManualItv = manualitv1)




