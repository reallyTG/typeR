library(geozoning)


### Name: randKmap
### Title: randKmap: Generate data for zoning or prepare real data
### Aliases: randKmap

### ** Examples

map = randKmap(NULL,nPointsK=200,Vmean=15,krig=2)
mean(map$krigGrid) # mean of generated kriged data
plotMap(map)



