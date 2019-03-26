library(GESE)


### Name: GESE-package
### Title: Gene-Based Segregation Test
### Aliases: GESE-package
### Keywords: package

### ** Examples

data(pednew)
data(mapInfo)
data(dataRaw)
data(database)
results <- GESE(pednew, database, 1000000, dataRaw, mapInfo, threshold=1e-2)
results




