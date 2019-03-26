library(monographaR)


### Name: mapDiversity
### Title: Diversity heatmap
### Aliases: mapDiversity

### ** Examples


## loading the example data

data(monographaR_examples)
monographaR_examples$map_data -> data
head(data)

## running the function

mapDiversity(data , resolution=1, plot=TRUE, plot.with.grid=TRUE)

## Without the grid borders

mapDiversity(data , resolution=1, plot=TRUE, plot.with.grid=FALSE)

## Changing colors

mapDiversity(data , resolution=1, plot=TRUE, col=gray.colors(55))

## Changing transparency

mapDiversity(data , resolution=1, plot=TRUE, alpha=0.5)

## The function returns a raster object

mapDiversity(data , resolution=1, plot=TRUE, alpha=0.5) -> my.div.raster
my.div.raster
plot(my.div.raster)





