library(geozoning)


### Name: calRMmodel
### Title: transform VGM model into model usable by RandomFields
### Aliases: calRMmodel

### ** Examples

modv=gstat::vgm(model="Gau",range=100,psill=10,mean=7)
RMmodel=calRMmodel(modv)



