library(Umatrix)


### Name: esomTrain
### Title: Train an ESOM (emergent self organizing map) and project data
### Aliases: esomTrain
### Keywords: ESOM esom som SOM self organizing map

### ** Examples

data('Hepta')
res=esomTrain(Hepta$Data, Key = 1:nrow(Hepta$Data))



