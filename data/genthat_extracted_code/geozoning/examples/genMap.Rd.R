library(geozoning)


### Name: genMap
### Title: Wrapper for randKmap, generate 2D map
### Aliases: genMap

### ** Examples

m=genMap(seed=1,krig=2,disp=1,nPointsK = 200) #generates a map and plots data
mean(m$krigGrid) # mean of generated kriged data



