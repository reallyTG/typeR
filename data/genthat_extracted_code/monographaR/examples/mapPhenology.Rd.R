library(monographaR)


### Name: mapPhenology
### Title: Phenology heatmap
### Aliases: mapPhenology

### ** Examples


### load the example data

data(monographaR_examples)
monographaR_examples$mapPhenology -> data
head(data) ## check the first rows

### running the function

# mapPhenology(data, binary=FALSE, by_species=FALSE, legend=FALSE)

### changing the colors

# mapPhenology(data, binary=FALSE, by_species=FALSE, legend=FALSE, col=rev(terrain.colors(55)))

### exporting raster

# require(raster)
# mapPhenology(data, binary=FALSE, by_species=FALSE, legend=FALSE) -> myphenorasters
# plot(myphenorasters[[1]]) ## plot first month
# writeRaster(myphenorasters[[2]], "pheno_month2.asc") ## exporting 2nd month

### making an GIF animation

# require(animation)
# saveGIF(
#  {mapPhenology(data, binary=F, resolution=0.5, by_species=F, legend=F, mfrow=c(1,1))},
#  movie.name="phenology.gif", interval=0.5, ani.width=600, ani.height=600
# )






