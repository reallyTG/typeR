library(GESE)


### Name: GESE
### Title: Gene-Based Segregation Test
### Aliases: GESE

### ** Examples

data(pednew)
data(mapInfo)
data(dataRaw)
data(database)
results <- GESE(pednew, database, 1000000, dataRaw, mapInfo, threshold=1e-3)
results




