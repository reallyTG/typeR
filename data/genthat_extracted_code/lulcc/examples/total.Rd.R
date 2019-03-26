library(lulcc)


### Name: total
### Title: Total number of cells in a categorical Raster* object
### Aliases: total

### ** Examples


## Sibuyan Island

## load observed land use data
obs <- ObsLulcRasterStack(x=sibuyan$maps,
                    pattern="lu",
                    categories=c(1,2,3,4,5),
                    labels=c("Forest","Coconut","Grass","Rice","Other"),
                    t=c(0,14))

total(x=obs)
total(x=obs[[1]])
total(x=obs[[2]])




